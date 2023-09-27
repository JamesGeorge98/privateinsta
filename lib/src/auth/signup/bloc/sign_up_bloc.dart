import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignupButtonPressed) {
      yield SignUpLoading();
      try {
        // Simulate a signup process (replace with your actual signup logic)
        await Future.delayed(const Duration(seconds: 2));
        yield SignUpSuccess();
      } catch (error) {
        yield SignupFailure(error: 'Signup failed: $error');
      }
    }
  }
}
