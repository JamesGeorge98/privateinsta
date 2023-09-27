part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignupButtonPressed extends SignUpEvent {
  final String email;
  final String password;

  SignupButtonPressed({required this.email, required this.password});
}