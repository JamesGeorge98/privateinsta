import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/src/auth/signup/signup_view.dart';
import 'package:privateinsta/src/settings/settings_view.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/dividers.dart';
import 'package:privateinsta/src/widgets/sizedbox.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:privateinsta/src/widgets/texts.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PISizedBox space = PISizedBox();
  bool isVisiable = false;

  late final TextEditingController emailController;

  late final TextEditingController passController;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
              ),
              Text(
                "Instagram",
                style: GoogleFonts.cookie(fontSize: 50),
              ),
              space.sizedHeight(),
              PITextFormField(
                      hint: "Phone number, email or email address",
                      textEditingController: emailController)
                  .basicInput(),
              space.sizedHeight(height: 20),
              StatefulBuilder(builder: (context, setState) {
                return PITextFormField(
                    hint: "Password",
                    obscureText: !isVisiable,
                    textEditingController: passController,
                    suffixIcon: InkWell(
                      onTap: () {
                        isVisiable = !isVisiable;
                        setState(() {});
                      },
                      child: CustomWidgets().visibleIcons(visiable: isVisiable),
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
                        Navigator.restorablePushNamed(
                            context, SettingsView.routeName);
                      },
                      child: const Text("Log In"))
                  .expanded(context),
              space.sizedHeight(height: 20),
              PIDividers.centerText(text: "OR"),
              space.sizedHeight(height: 20),
              TextButton.icon(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.transparent),
                      foregroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade800)),
                  onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}
