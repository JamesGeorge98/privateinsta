import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/src/auth/signup/bloc/sign_up_bloc.dart';
import 'package:privateinsta/src/auth/signup/views/create_email_number.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:privateinsta/src/widgets/texts.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  static const SizedBox space = SizedBox();

  static const String routeName = '/createpassword';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                      'Create a password',
                      style: PITextStyle().headerTextStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Choose a username for your new account. You can always change it later.',
                        style: PITextStyle().bodyTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    space.sizedHeight(),
                    PITextFormField(
                      obscureText: true,
                      hint: 'Password',
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
                    CheckboxListTile.adaptive(
                      visualDensity: VisualDensity.compact,
                      value: state.savePassword,
                      overlayColor: const MaterialStatePropertyAll<Color?>(
                        AppColors.transparent,
                      ),
                      dense: false,
                      splashRadius: 0,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      activeColor: AppColors.blue,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (bool? value) {
                        context.read<SignUpBloc>().add(
                              SavepasswordButtonPressed(
                                savePassword: value ?? true,
                              ),
                            );
                      },
                      title: const Text('Save password'),
                    ),
                    space.sizedHeight(height: 10),
                    PIElevatedButton(
                      onPressed: state.password.length < 6
                          ? null
                          : () {
                              final FormState? form = formKey.currentState;
                              if (form != null && form.validate()) {
                                Navigator.restorablePushNamed(
                                  context,
                                  CreatePhoneNumberOrEmail.routeName,
                                );
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
