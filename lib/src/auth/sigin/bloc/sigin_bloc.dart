import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/src/auth/auth_repo.dart';
part 'sigin_event.dart';
part 'sigin_state.dart';

class SiginBloc extends Bloc<SiginEvent, SiginState> {
  SiginBloc({required this.authService}) : super(const SiginState()) {
    on<LoginButtonPressedEvent>(_handleLogin);
    on<UserTextFieldChange>(_handleLoginEmailChangedEvent);
    on<PasswordTextFieldChange>(_handleLoginPasswordChangedEvent);
    on<PasswordVisiablityPressed>(_handlePasswordVisiblity);
  }

  final AuthenticationRepository authService;

  Future<void> _handleLogin(
    LoginButtonPressedEvent event,
    Emitter<SiginState> emit,
  ) async {
    try {
      emit(state.copyWith(message: 'LOADING', status: SignInStatus.loading));

      // await authService.signIn(
      //   email: state.email,
      //   password: state.password,
      // );
      // print("event done");
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(message: 'Success', status: SignInStatus.success));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: SignInStatus.failure));
    }
  }

  Future<void> _handleLoginEmailChangedEvent(
    UserTextFieldChange event,
    Emitter<SiginState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleLoginPasswordChangedEvent(
    PasswordTextFieldChange event,
    Emitter<SiginState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handlePasswordVisiblity(
    PasswordVisiablityPressed event,
    Emitter<SiginState> emit,
  ) async {
    emit(
      state.copyWith(isVisible: !state.isVisible),
    );
  }
}
