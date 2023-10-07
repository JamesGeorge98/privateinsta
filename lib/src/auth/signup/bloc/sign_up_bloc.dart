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
    on<UserNameCheckEvent>(_handleLoginUserNameChangedEvent);
    on<CheckUserNameAPI>(_hitChangeTextFieldStatus);
  }

  final AuthenticationRepository authService;

  TextEditingController usernameController = TextEditingController();

  Timer? _debounceTimer;

  Future<void> _handleLoginUserNameChangedEvent(
    UserNameCheckEvent event,
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
        emit(state.copyWith(username: event.username));
      }

      if (_debounceTimer != null) {
        _debounceTimer!.cancel();
      }

      _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
        add(CheckUserNameAPI(isLoading: true));

        if (state.username.isNotEmpty) {
          try {
            await authService.checkUserName(userName: state.username);
          } catch (e) {
            print(e);
            rethrow;
          }
        }
        add(CheckUserNameAPI(isLoading: false));
      });
    } on CustomException catch (e) {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
          expection: e,
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

  Future<void> _hitChangeTextFieldStatus(
    CheckUserNameAPI event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      if (event.isLoading) {
        emit(
          state.copyWith(
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
    } catch (e) {}
  }

  @override
  Future<void> close() async {
    usernameController.dispose();
    await super.close();
  }
}
