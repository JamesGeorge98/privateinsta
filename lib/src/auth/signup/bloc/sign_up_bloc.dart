import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/src/auth/auth_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.authService}) : super(const SignUpState()) {
    on<UserNameCheckEvent>(_handleLoginUserNameChangedEvent);
  }

  final AuthenticationRepository authService;

  Future<void> _handleLoginUserNameChangedEvent(
    UserNameCheckEvent event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      emit(state.copyWith(username: event.username));
      await authService.checkUserName(userName: state.username);
    } catch (e) {
      print(e);
    }
  }
}
