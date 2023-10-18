import 'dart:async';
import 'dart:math' as math;
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/utils/exception.dart';
import 'package:privateinsta/core/utils/phone_number.dart';
import 'package:privateinsta/src/auth/auth_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.authService}) : super(const SignUpState()) {
    on<UserNameTextfieldChangeEvent>(_handleUserNameChangedEvent);
    on<CheckUserNameAPIHit>(_hitChangeTextFieldStatus);
    on<PasswordTextfieldChangeEvent>(_hitPasswordChangeEvent);
    on<SavepasswordButtonPressed>(_hitSavePasswordEvent);
    on<PhoneNumberFieldChnageEvent>(_hitPhoneNumberChangeEvent);
    on<EmailChangeEvent>(_hitEmailChangeEvent);
  }

  final AuthenticationRepository authService;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Timer? _debounceTimer;

  Future<void> _handleUserNameChangedEvent(
    UserNameTextfieldChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      if (event.username.contains(' ')) {
        final String text = usernameController.text;
        final TextSelection selection = usernameController.selection;
        final String newText = text.replaceAll(' ', '_');
        usernameController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(
            offset: selection.baseOffset,
          ),
        );
      } else {
        emit(
          state.copyWith(
            username: event.username,
          ),
        );
      }
      await _hitCheckUserNameAPI();
    } on CustomException catch (e) {
      emit(
        state.copyWith(
          expection: e,
          status: SignUpStatus.failure,
          suffixIcon: const SizedBox(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          expection: CustomException.somthingWentWrong(),
          status: SignUpStatus.failure,
          suffixIcon: const SizedBox(),
        ),
      );
    }
  }

  Future<void> _hitCheckUserNameAPI() async {
    add(CheckUserNameAPIHit(isLoading: true));
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 1500), () async {
      if (state.username.isNotEmpty) {
        try {
          final List<String> names =
              await authService.checkUserName(userName: state.username);
          add(CheckUserNameAPIHit(isLoading: false, names: names));
        } on CustomException catch (e) {
          add(CheckUserNameAPIHit(isLoading: false, error: e));
        } catch (e) {
          add(
            CheckUserNameAPIHit(
              isLoading: false,
              error: CustomException.somthingWentWrong(),
            ),
          );
        }
      }
    });
  }

  Future<void> _hitChangeTextFieldStatus(
    CheckUserNameAPIHit event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      if (event.error != null) {
        emit(
          state.copyWith(
            status: SignUpStatus.failure,
            expection: event.error,
            suffixIcon: InkWell(
              onTap: () {
                usernameController.clear();
              },
              child: Transform.rotate(
                angle: 41.6,
                child: const Icon(
                  Icons.add_circle_outline_sharp,
                  color: AppColors.grey,
                  size: 16,
                ),
              ),
            ),
          ),
        );
      } else {
        if (event.isLoading) {
          emit(
            state.copyWith(
              expection: event.error,
              status: SignUpStatus.loading,
              suffixIcon: const CupertinoActivityIndicator(),
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: SignUpStatus.success,
              availableNames: event.names,
              suffixIcon: event.names?.isEmpty ?? false
                  ? const Icon(
                      Icons.check_circle_outline_outlined,
                      color: AppColors.green,
                    )
                  : InkWell(
                      onTap: () {
                        usernameController.clear();
                      },
                      child: Transform.rotate(
                        angle: 41.6,
                        child: const Icon(
                          Icons.add_circle_outline_sharp,
                          color: AppColors.grey,
                          size: 16,
                        ),
                      ),
                    ),
            ),
          );
        }
      }
    } catch (e) {}
  }

  Future<void> _hitPasswordChangeEvent(
    PasswordTextfieldChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    passwordController.value = TextEditingValue(
      text: passwordController.text,
      selection: TextSelection.collapsed(
        offset: passwordController.selection.baseOffset,
      ),
    );
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  Future<void> _hitSavePasswordEvent(
    SavepasswordButtonPressed event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        savePassword: event.savePassword,
      ),
    );
  }

  Future<void> _hitPhoneNumberChangeEvent(
    PhoneNumberFieldChnageEvent event,
    Emitter<SignUpState> emit,
  ) async {
    phoneController.value = TextEditingValue(
      text: phoneController.text,
      selection: TextSelection.collapsed(
        offset: phoneController.selection.baseOffset,
      ),
    );
    event.phoneNumber?.phoneNumber = phoneController.text;
    emit(
      state.copyWith(
        phoneNumber: event.phoneNumber,
      ),
    );
  }

  Future<void> _hitEmailChangeEvent(
    EmailChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emailController.value = TextEditingValue(
      text: emailController.text,
      selection: TextSelection.collapsed(
        offset: emailController.selection.baseOffset,
      ),
    );
    state.copyWith(
      email: event.email,
    );
  }

  @override
  Future<void> close() async {
    usernameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();
    await super.close();
  }
}
