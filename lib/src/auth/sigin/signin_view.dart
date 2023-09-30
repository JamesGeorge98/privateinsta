import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/auth/sigin/bloc/sigin_bloc.dart';
import 'package:privateinsta/src/auth/signup/signup_view.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';
import 'package:privateinsta/src/settings/settings_view.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/dividers.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:http/http.dart' as http;


class SigInScreen extends StatefulWidget {
  const SigInScreen({super.key});

  static const routeName = '/signin';

  @override
  State<SigInScreen> createState() => _SigInScreenState();
}

class _SigInScreenState extends State<SigInScreen> {
  SizedBox space = const SizedBox();
  bool isVisiable = false;

  // late final TextEditingController emailController;

  // late final TextEditingController passController;

  // @override
  // void initState() {
  //   emailController = TextEditingController();
  //   passController = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .9,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: BlocConsumer<SiginBloc, SiginState>(
                listener: (context, state) {
                  if (state.status == SignInStatus.success) {
                    // Navigator.restorablePushNamed(
                    //     context, MainScreen.routeName);
                  }
                },
                builder: (context, state) {
                  print(state.status);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        "Instagram",
                        style: GoogleFonts.cookie(fontSize: 50),
                      ),
                      space.sizedHeight(),
                      PITextFormField(
                        hint: "Phone number, email or email address",
                        onChanged: ((value) {
                          context
                              .read<SiginBloc>()
                              .add(UserTextFieldChange(email: value));
                        }),
                      ).basicInput(),
                      space.sizedHeight(height: 20),
                      StatefulBuilder(builder: (context, setState) {
                        return PITextFormField(
                            hint: "Password",
                            onChanged: ((value) {
                              context.read<SiginBloc>().add(
                                  PasswordTextFieldChange(password: value));
                            }),
                            obscureText: !isVisiable,
                            suffixIcon: InkWell(
                              onTap: () async {
                                final response = await http.get(Uri.parse(
                                    "http://10.0.2.2:3000/api/v1/auth/james"));
                                print(response);
                                isVisiable = !isVisiable;
                                setState(() {});
                              },
                              child: Icon(isVisiable
                                  ? AppIcons.visiblityicon
                                  : AppIcons.invisiblityicon),
                            )).basicInput();
                      }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: PITextButton(
                                onPressed: () {},
                                child: const Text("Forgotten password?"))
                            .basic(),
                      ),
                      space.sizedHeight(),
                      PIElevatedButton(
                              onPressed: () {
                                context
                                    .read<SiginBloc>()
                                    .add(LoginButtonPressedEvent());
                              },
                              child: (state.status == SignInStatus.loading)
                                  ? const CupertinoActivityIndicator()
                                  : const Text("Log In"))
                          .expanded(context),
                      space.sizedHeight(height: 20),
                      PIDividers.centerText(text: "OR"),
                      space.sizedHeight(height: 20),
                      TextButton.icon(
                          style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => AppColors.transparent),
                              foregroundColor: MaterialStatePropertyAll(
                                  Colors.blue.shade800)),
                          onPressed: () {
                            Navigator.restorablePushNamed(
                                context, SettingsView.routeName);
                          },
                          icon: const Icon(Icons.facebook),
                          label: const Text("Log in with Facebook")),
                      const Spacer(),
                      Divider(
                        color: Colors.grey.shade500,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Dont have an account?",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          PITextButton(
                              onPressed: () {
                                Navigator.restorablePushNamed(
                                    context, SignUpScreen.routeName);
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )).basic(),
                        ],
                      ),
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
}
