part of 'sign_up_bloc.dart';

enum SignUpStatus { success, failure, loading, idle }

class SignUpState extends Equatable {
  const SignUpState({
    this.username = '',
    this.suffixIcon,
    this.status = SignUpStatus.idle,
    this.expection,
  });

  final String username;
  final Widget? suffixIcon;
  final SignUpStatus status;
  final CustomException? expection;

  SignUpState copyWith({
    String? username,
    Widget? suffixIcon,
    SignUpStatus? status,
    CustomException? expection,
  }) {
    return SignUpState(
      username: username ?? this.username,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      status: status ?? this.status,
      expection:  expection ?? this.expection,
    );
  }

  @override
  List<Object?> get props => <Object?>[username, suffixIcon, status,expection];
}
