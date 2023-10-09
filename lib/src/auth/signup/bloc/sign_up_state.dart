part of 'sign_up_bloc.dart';

enum SignUpStatus { success, failure, loading, idle }

class SignUpState extends Equatable {
  const SignUpState({
    this.username = '',
    this.suffixIcon,
    this.status = SignUpStatus.idle,
    this.availableNames,
    this.expection,
  });

  final String username;
  final Widget? suffixIcon;
  final SignUpStatus status;
  final CustomException? expection;
  final List<String>? availableNames;

  SignUpState copyWith({
    String? username,
    Widget? suffixIcon,
    SignUpStatus? status,
    CustomException? expection,
    List<String>? availableNames,
  }) {
    return SignUpState(
      username: username ?? this.username,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      status: status ?? this.status,
      expection: expection ?? this.expection,
      availableNames : availableNames ?? this.availableNames,
    );
  }

  @override
  List<Object?> get props => <Object?>[username, suffixIcon, status, expection];
}
