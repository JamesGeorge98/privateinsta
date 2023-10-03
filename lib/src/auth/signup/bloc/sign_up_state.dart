part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.username = '',
  });

  final String username;

  SignUpState copyWith({
    String? username,
  }) {
    return SignUpState(
      username: username ?? this.username,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        username,
      ];
}
