part of 'sign_up_bloc.dart';

enum SignUpStatus { success, failure, loading, idle }

class SignUpState extends Equatable {
  const SignUpState({
    this.username = '',
    this.suffixIcon,
    this.status = SignUpStatus.idle,
    this.availableNames,
    this.expection,
    this.password = '',
    this.phoneNumber,
    this.email,
    this.savePassword = true,
  });

  final String username;
  final Widget? suffixIcon;
  final SignUpStatus status;
  final CustomException? expection;
  final List<String>? availableNames;
  final String password;
  final bool savePassword;
  final PhoneNumber? phoneNumber;
  final String? email;

  SignUpState copyWith({
    String? username,
    String? password,
    Widget? suffixIcon,
    SignUpStatus? status,
    CustomException? expection,
    List<String>? availableNames,
    bool? savePassword,
    PhoneNumber? phoneNumber,
    String? email,
    }) {
    return SignUpState(
      email: email ?? this.email,
      savePassword: savePassword ?? this.savePassword,
      password: password ?? this.password,
      username: username ?? this.username,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      status: status ?? this.status,
      expection: expection ?? this.expection,
      availableNames: availableNames ?? this.availableNames,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        username,
        suffixIcon,
        status,
        expection,
        password,
        savePassword,
        phoneNumber,
        email,
      ];
}
