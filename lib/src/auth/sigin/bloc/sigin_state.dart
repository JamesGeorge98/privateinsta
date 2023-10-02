part of 'sigin_bloc.dart';

enum SignInStatus { success, failure, loading, idle }

class SiginState extends Equatable {
  const SiginState({
    this.message = '',
    this.status = SignInStatus.idle,
    this.email = '',
    this.password = '',
    this.isVisible = false,
  });

  final String message;
  final SignInStatus status;
  final String email;
  final String password;
  final bool isVisible;

  SiginState copyWith({
    String? email,
    String? password,
    SignInStatus? status,
    String? message,
    bool? isVisible,
  }) {
    return SiginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        message,
        status,
        email,
        password,
        isVisible,
      ];
}




//abstract class SiginState extends Equatable {}

// class SiginIntialState extends SiginState {
//   @override
//   List<Object?> get props => <Object?>[];
// }

// class SiginLoadingState extends SiginState {
//   @override
//   List<Object?> get props => <Object?>[];
// }

// class SiginPasswordTextFieldState extends SiginState {
//   SiginPasswordTextFieldState({required this.password});

//   final String password;
//   @override
//   List<Object?> get props => <Object?>[password];
// }

// class SiginPasswordIsObscureState extends SiginState {
//   @override
//   List<Object?> get props => <Object?>[];
// }

// class SiginPasswordIsVisiableState extends SiginState {
//   @override
//   List<Object?> get props => <Object?>[];
// }

// class SiginAuthenticatedState extends SiginState {
//   @override
//   List<Object?> get props => <Object?>[];
// }

// class SiginNotAuthenticatedState extends SiginState {
//   @override
//   List<Object?> get props => <Object?>[];
// }

// class SiginErrorState extends SiginState {
//   @override
//   List<Object?> get props => <Object?>[];
// }