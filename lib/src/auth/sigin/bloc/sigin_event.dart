part of 'sigin_bloc.dart';

sealed class SiginEvent {}

class UserTextFieldChange extends SiginEvent{
  final String email;

  UserTextFieldChange({required this.email}); 
}

class PasswordTextFieldChange extends SiginEvent{
   final String password;

  PasswordTextFieldChange({required this.password}); 
}

class PasswordVisiablityPressed extends SiginEvent{}

class ForgotButtonPressed extends SiginEvent{}

class LoginButtonPressedEvent extends SiginEvent{}

class LoginWithFBButtonPressed extends SiginEvent{}

class SignUpButtonPressed extends SiginEvent{}


