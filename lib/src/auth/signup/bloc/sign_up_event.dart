part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {}

class SignupButtonPressed extends SignUpEvent {
  SignupButtonPressed({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object?> get props => <Object?>[email, password];
}

class UserNameCheckEvent extends SignUpEvent {
  UserNameCheckEvent({required this.username});
  final String username;

  @override
  List<Object?> get props => <Object?>[username];
}

class CheckUserNameAPI extends SignUpEvent {
  CheckUserNameAPI({required this.isLoading});

  final  bool isLoading ;

  @override
  List<Object?> get props => <Object?>[isLoading];
}
