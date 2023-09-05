import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Instagram",
                style: GoogleFonts.cookie(fontSize: 50),
              ),
              PISizedBox().sizedHeight(),
              PITextFormField(hint: "Phone number, email or email address")
                  .basicInput(),
              PISizedBox().sizedHeight(height: 20),
              PITextFormField(
                      hint: "Password",
                      suffixIcon: CustomWidgets().visibleIcons())
                  .basicInput(),
              Align(
                alignment: Alignment.centerRight,
                child: PITextButton(
                        onPressed: () {},
                        child: const Text("Forgotten password?"))
                    .basic(),
              ),
              PIElevatedButton(onPressed: () {}, child: const Text("Log In"))
                  .expanded(context),
              PISizedBox().sizedHeight(height: 20),
              PIDividers.centerText(text: "OR"),
              PISizedBox().sizedHeight(height: 20),
              TextButton.icon(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.transparent),
                      foregroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade800)),
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                  label: const Text("Log in with Facebook")),
              SizedBox(
                height: MediaQuery.of(context).size.height * .12,
              ),
              Divider(
                color: Colors.grey.shade500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(color: Colors.grey.shade900, fontSize: 12),
                  ),
                  PITextButton(
                      onPressed: () {},
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
