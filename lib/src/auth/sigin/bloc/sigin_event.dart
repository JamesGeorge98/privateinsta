part of 'sigin_bloc.dart';

sealed class SiginEvent extends Equatable {}

class UserTextFieldChange extends SiginEvent {
  UserTextFieldChange({required this.email});
  final String email;

  @override
  List<Object?> get props => <Object?>[email];
}

class PasswordTextFieldChange extends SiginEvent {
  PasswordTextFieldChange({required this.password});
  final String password;

  @override
  List<Object?> get props => <Object?>[password];
}

class PasswordVisiablityPressed extends SiginEvent {
  PasswordVisiablityPressed({required this.isVisiable});

  final bool isVisiable;
  @override
  List<Object?> get props => <Object?>[isVisiable];
}

class ForgotButtonPressed extends SiginEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class LoginButtonPressedEvent extends SiginEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class LoginWithFBButtonPressed extends SiginEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class SignUpButtonPressed extends SiginEvent {
  @override
  List<Object?> get props => <Object?>[];
}
