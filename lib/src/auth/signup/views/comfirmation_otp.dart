import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/src/auth/signup/bloc/sign_up_bloc.dart';

import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:privateinsta/src/widgets/texts.dart';

class OTPConfirmView extends StatelessWidget {
  const OTPConfirmView({super.key});

  static const SizedBox space = SizedBox();

  static const String routeName = '/confirmotp';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    const TextStyle defaultStyle = TextStyle(color: Colors.grey);
    const TextStyle linkStyle = TextStyle(color: Colors.blue);

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
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (BuildContext context, SignUpState state) {},
            builder: (BuildContext context, SignUpState state) {
              return Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Enter the confirmation code we sent to',
                      style: PITextStyle().headerTextStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: RichText(
                        text: TextSpan(
                          style: defaultStyle,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Change phone number ',
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            const TextSpan(text: 'or '),
                            TextSpan(
                              text: 'Send SMS message again.',
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    space.sizedHeight(),
                    PITextFormField(
                      obscureText: true,
                      hint: 'Confirmation Code',
                      textEditingController:
                          context.read<SignUpBloc>().passwordController,
                      suffixIcon: state.password.isEmpty
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                context
                                    .read<SignUpBloc>()
                                    .passwordController
                                    .clear();
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
                      onChanged: (String value) {
                        context
                            .read<SignUpBloc>()
                            .add(PasswordTextfieldChangeEvent(password: value));
                      },
                    ).basicInput(),
                    space.sizedHeight(height: 10),
                    space.sizedHeight(height: 10),
                    PIElevatedButton(
                      onPressed: state.password.length < 6
                          ? null
                          : () {
                              final FormState? form = formKey.currentState;
                              if (form != null && form.validate()) {
                                
                              }
                            },
                      child: const Text('Next'),
                    ).expanded(context),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
