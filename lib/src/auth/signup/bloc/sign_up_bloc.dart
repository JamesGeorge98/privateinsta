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

      await authService.checkUserName(userName: state.username);
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
