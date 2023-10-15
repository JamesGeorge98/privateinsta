part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {}

class SignupButtonPressed extends SignUpEvent {
  SignupButtonPressed({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object?> get props => <Object?>[email, password];
}

class UserNameTextfieldChangeEvent extends SignUpEvent {
  UserNameTextfieldChangeEvent({required this.username});
  final String username;

  @override
  List<Object?> get props => <Object?>[username];
}

class PasswordTextfieldChangeEvent extends SignUpEvent {
  PasswordTextfieldChangeEvent({required this.password});
  final String password;

  @override
  List<Object?> get props => <Object?>[password];
}

class SavepasswordButtonPressed extends SignUpEvent {
  SavepasswordButtonPressed({required this.savePassword});
  final bool savePassword;

  @override
  List<Object?> get props => <Object?>[savePassword];
}

class TextFieldClearEvent extends SignUpEvent {
  TextFieldClearEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class CheckUserNameAPIHit extends SignUpEvent {
  CheckUserNameAPIHit({
    required this.isLoading,
    this.names,
    this.error,
  });

  final bool isLoading;
  final CustomException? error;
  final List<String>? names;

  @override
  List<Object?> get props => <Object?>[isLoading, error, names];
}
