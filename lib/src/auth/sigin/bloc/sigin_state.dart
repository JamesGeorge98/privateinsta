part of 'sigin_bloc.dart';

enum SignInStatus {
  success,
  failure,
  loading,
  idle
}

// sealed class SiginState {}

class SiginState extends Equatable {
  const SiginState({
    this.message = '',
    this.status = SignInStatus.idle,
    this.email = '',
    this.password = '',
  });

  final String message;
  final SignInStatus status;
  final String email;
  final String password;

  SiginState copyWith({
    String? email,
    String? password,
    SignInStatus? status,
    String? message,
  }) {
    return SiginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        email,
        password,
      ];
}
