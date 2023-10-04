import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/auth/sigin/bloc/sigin_bloc.dart';
import 'package:privateinsta/src/auth/signup/signup_view.dart';
import 'package:privateinsta/src/settings/settings_view.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/dividers.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';

class SigInScreen extends StatelessWidget {
  const SigInScreen({super.key});

  static const String routeName = '/signin';

  static const SizedBox space = SizedBox();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .9,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: BlocConsumer<SiginBloc, SiginState>(
                listener: (BuildContext context, SiginState state) {
                  if (state.status == SignInStatus.success) {
                    // Navigator.restorablePushNamed(
                    //     context, MainScreen.routeName);
                  }
                },
                builder: (BuildContext context, SiginState state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        'Instagram',
                        style: GoogleFonts.cookie(fontSize: 50),
                      ),
                      space.sizedHeight(),
                      email(context).basicInput(),
                      space.sizedHeight(),
                      password(context, state).basicInput(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: PITextButton(
                          onPressed: () {},
                          child: const Text('Forgotten password?'),
                        ).basic(),
                      ),
                      space.sizedHeight(),
                      loginButton(context, state).expanded(context),
                      space.sizedHeight(),
                      PIDividers.centerText(text: 'OR'),
                      space.sizedHeight(),
                      TextButton.icon(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> states) =>
                                AppColors.transparent,
                          ),
                          foregroundColor: MaterialStatePropertyAll<Color>(
                            Colors.blue.shade800,
                          ),
                        ),
                        onPressed: () {
                          Navigator.restorablePushNamed(
                            context,
                            SettingsView.routeName,
                          );
                        },
                        icon: const Icon(Icons.facebook),
                        label: const Text('Log in with Facebook'),
                      ),
                      const Spacer(),
                      Divider(
                        color: Colors.grey.shade500,
                      ),
                      signUpButton(context),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  PIElevatedButton loginButton(BuildContext context, SiginState state) {
    return PIElevatedButton(
      onPressed: () {
        context.read<SiginBloc>().add(LoginButtonPressedEvent());
      },
      child: (state.status == SignInStatus.loading)
          ? const CupertinoActivityIndicator()
          : const Text('Log In'),
    );
  }

  Row signUpButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Dont have an account?',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        PITextButton(
          onPressed: () {
            Navigator.restorablePushNamed(
              context,
              SignUpScreen.routeName,
            );
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ).basic(),
      ],
    );
  }

  PITextFormField password(BuildContext context, SiginState state) {
    return PITextFormField(
      hint: 'Password',
      onChanged: (String value) {
        context.read<SiginBloc>().add(
              PasswordTextFieldChange(password: value),
            );
      },
      obscureText: !state.isVisible,
      suffixIcon: InkWell(
        onTap: () {
          context.read<SiginBloc>().add(
                PasswordVisiablityPressed(
                  isVisiable: state.isVisible,
                ),
              );
        },
        child: Icon(
          state.isVisible ? AppIcons.visiblityicon : AppIcons.invisiblityicon,
        ),
      ),
    );
  }

  PITextFormField email(BuildContext context) {
    return PITextFormField(
      hint: 'Phone number, email or email address',
      onChanged: (String value) {
        context.read<SiginBloc>().add(UserTextFieldChange(email: value));
      },
    );
  }
}
