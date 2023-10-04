part of 'sign_up_bloc.dart';

enum SignUpStatus { success, failure, loading, idle }

class SignUpState extends Equatable {
  const SignUpState({
    this.username = '',
    this.status = SignUpStatus.idle,
  });

  final String username;
  final SignUpStatus status;

  SignUpState copyWith({
    String? username,
    SignUpStatus? status,
  }) {
    return SignUpState(
      username: username ?? this.username,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        username,
      ];
}
