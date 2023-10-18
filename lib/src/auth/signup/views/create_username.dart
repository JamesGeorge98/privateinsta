import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/src/auth/signup/bloc/sign_up_bloc.dart';
import 'package:privateinsta/src/auth/signup/views/create_password.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/snack_bar.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:privateinsta/src/widgets/texts.dart';

class CreateUserName extends StatelessWidget {
  const CreateUserName({super.key});

  static const String routeName = '/createusername';

  static const SizedBox space = SizedBox();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (BuildContext context, SignUpState state) {
              if (state.status == SignUpStatus.failure) {
                PISanckBar(
                  content: Text(state.expection!.message),
                ).showSnackBar(context);
              }
              if (state.status == SignUpStatus.success) {
                final FormState? form = formKey.currentState;
                if (form != null) {
                  if (state.availableNames!.isNotEmpty) {
                    form.validate();
                  } else {
                    form.reset();
                  }
                }
              }
            },
            builder: (BuildContext context, SignUpState state) {
              return Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Create username',
                      style: PITextStyle().headerTextStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Choose a username for your new account. You can always change it later.',
                        style: PITextStyle().bodyTextStyle(size: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    space.sizedHeight(),
                    PITextFormField(
                      suffixIcon: state.suffixIcon,
                      hint: 'Username',
                      textEditingController:
                          context.read<SignUpBloc>().usernameController,
                      onChanged: (String value) {
                        context
                            .read<SignUpBloc>()
                            .add(UserNameTextfieldChangeEvent(username: value));
                      },
                      validator: (String? text) {
                        return 'This username is not avaliable';
                      },
                    ).basicInput(),
                    space.sizedHeight(),
                    PIElevatedButton(
                      autoFocus: true,
                      onPressed: state.username.isEmpty ||
                              state.status == SignUpStatus.loading ||
                              state.status == SignUpStatus.failure
                          ? null
                          : () {
                              Navigator.restorablePushNamed(
                                context,
                                CreatePassword.routeName,
                              );
                            },
                      child: const Text('Next'),
                    ).expanded(context),
                    Expanded(
                      child: availableUserNames(
                        state.availableNames ?? <String>[],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget availableUserNames(List<String> availablesName) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          context.read<SignUpBloc>().add(
                UserNameTextfieldChangeEvent(username: availablesName[index]),
              );
          context.read<SignUpBloc>().usernameController.text =
              availablesName[index];
        },
        child: ListTile(
          leading: Text(
            availablesName[index],
          ),
          trailing: const Icon(
            Icons.check_circle_outline_rounded,
            color: AppColors.green,
          ),
        ),
      ),
      itemCount: availablesName.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
      ),
    );
  }
}
