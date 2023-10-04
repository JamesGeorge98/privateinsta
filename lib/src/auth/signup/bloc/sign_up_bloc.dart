import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/src/auth/auth_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.authService}) : super(const SignUpState()) {
    on<UserNameCheckEvent>(_handleLoginUserNameChangedEvent);
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
        //emit(state.copyWith(status: SignUpStatus.loading));

        if (state.username != '') {
          await authService.checkUserName(userName: state.username);
        }

        //await Future<void>.delayed(const Duration(milliseconds: 500));

        //emit(state.copyWith(status: SignUpStatus.success));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> close() async {
    usernameController.dispose();
    await super.close();
  }
}
