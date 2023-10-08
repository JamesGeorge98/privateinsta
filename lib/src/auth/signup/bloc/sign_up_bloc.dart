import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/core/utils/exception.dart';
import 'package:privateinsta/src/auth/auth_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.authService}) : super(const SignUpState()) {
    on<UserNameTextfieldChangeEvent>(_handleUserNameChangedEvent);
    on<CheckUserNameAPIHit>(_hitChangeTextFieldStatus);
  }

  final AuthenticationRepository authService;

  TextEditingController usernameController = TextEditingController();

  Timer? _debounceTimer;

  Future<void> _handleUserNameChangedEvent(
    UserNameTextfieldChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      if (event.username.contains(' ')) {
        final String text = usernameController.text;
        final TextSelection selection = usernameController.selection;
        final String newText = text.replaceAll(' ', '_');
        usernameController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(
            offset: selection.baseOffset,
          ),
        );
      } else {
        emit(
          state.copyWith(
            username: event.username,
            status: SignUpStatus.idle,
          ),
        );
      }
      await _hitCheckUserNameAPI(emit);
    } on CustomException catch (e) {
      emit(
        state.copyWith(
          expection: e,
          status: SignUpStatus.failure,
          suffixIcon: const SizedBox(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          expection: CustomException.somthingWentWrong(),
          status: SignUpStatus.failure,
          suffixIcon: const SizedBox(),
        ),
      );
    }
  }

  Future<void> _hitCheckUserNameAPI(
    Emitter<SignUpState> emit,
  ) async {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 2000), () async {
      print('hit');
      if (state.username.isNotEmpty) {
        try {
          add(CheckUserNameAPIHit(isLoading: true));
          await authService.checkUserName(userName: state.username);
          add(CheckUserNameAPIHit(isLoading: false));
        } on CustomException catch (e) {
          add(CheckUserNameAPIHit(isLoading: false, error: e));
        } catch (e) {
          add(
            CheckUserNameAPIHit(
              isLoading: false,
              error: CustomException.somthingWentWrong(),
            ),
          );
        }
      }
    });
  }

  Future<void> _hitChangeTextFieldStatus(
    CheckUserNameAPIHit event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      if (event.error != null) {
        emit(
          state.copyWith(
            status: SignUpStatus.failure,
            expection: event.error,
            suffixIcon: const Icon(Icons.close_rounded),
          ),
        );
      } else {
        if (event.isLoading) {
          emit(
            state.copyWith(
              expection: event.error,
              status: SignUpStatus.loading,
              suffixIcon: const CupertinoActivityIndicator(),
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: SignUpStatus.success,
              suffixIcon: const Icon(Icons.check_circle_outline_outlined),
            ),
          );
        }
      }
    } catch (e) {}
  }

  @override
  Future<void> close() async {
    usernameController.dispose();
    await super.close();
  }
}
