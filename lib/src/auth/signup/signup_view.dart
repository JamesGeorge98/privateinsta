import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/src/settings/settings_view.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/dividers.dart';
import 'package:privateinsta/src/widgets/sizedbox.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:privateinsta/src/widgets/texts.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PISizedBox space = PISizedBox();
  bool isVisiable = false;

  late final TextEditingController usernameController;

  @override
  void initState() {
    usernameController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Create username",
                style: PITextStyle().headerTextStyle(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Choose a username for your new account. You can always chnage it later.",
                  style: PITextStyle().bodyTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              space.sizedHeight(height: 20),
              PITextFormField(
                  hint: "Username",
                  textEditingController: usernameController,
                  onChanged: (value) {
                    if (value.contains(' ')) {
                      final text = usernameController.text;
                      final selection = usernameController.selection;
                      final newText = text.replaceAll(' ', '_');
                      usernameController.value = TextEditingValue(
                        text: newText,
                        selection: TextSelection.collapsed(
                            offset: selection.baseOffset),
                      );
                    }
                  }).basicInput(),
              space.sizedHeight(height: 20),
              PIElevatedButton(
                      onPressed: () {
                        Navigator.restorablePushNamed(
                            context, SettingsView.routeName);
                      },
                      child: const Text("Next"))
                  .expanded(context),
              Expanded(child: availableUserNames())
            ],
          ),
        ),
      ),
    );
  }

  Widget availableUserNames() {
    return ListView.separated(
        itemBuilder: (context, index) => const ListTile(
            leading: Text(
              "Name",
            ),
            trailing: Icon(
              Icons.check_circle_outline_rounded,
              color: AppColors.green,
            )),
        itemCount: 5,
        separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
            ));
  }
}
