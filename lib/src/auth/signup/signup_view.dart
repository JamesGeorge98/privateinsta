import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/src/auth/signup/bloc/sign_up_bloc.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/page_transition.dart';
import 'package:privateinsta/src/widgets/snack_bar.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:privateinsta/src/widgets/texts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/signup';
  static const SizedBox space = SizedBox();

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (BuildContext context, SignUpState state) {
              if (state.status == SignUpStatus.failure) {
                PISanckBar(
                  content: Text(state.expection!.message),
                ).showSnackBar(context);
              }
            },
            builder: (BuildContext context, SignUpState state) {
              return Column(
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
                  ).basicInput(),
                  space.sizedHeight(),
                  PIElevatedButton(
                    autoFocus: true,
                    onPressed: state.username.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              PIPageRoute(
                                child: const CreatePassword(),
                                direction: AxisDirection.left,
                              ),
                            );
                          },
                    child: const Text('Next'),
                  ).expanded(context),
                  Expanded(child: availableUserNames()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget availableUserNames() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => const ListTile(
        leading: Text(
          'Name',
        ),
        trailing: Icon(
          Icons.check_circle_outline_rounded,
          color: AppColors.green,
        ),
      ),
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
      ),
    );
  }
}

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  SizedBox space = const SizedBox();
  bool isSaved = false;

  late final TextEditingController passwordController;

  @override
  void initState() {
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
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
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            children: <Widget>[
              Text(
                'Create a password',
                style: PITextStyle().headerTextStyle(),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Choose a username for your new account. You can always chnage it later.',
                  style: PITextStyle().bodyTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              space.sizedHeight(),
              PITextFormField(
                hint: 'Password',
                textEditingController: passwordController,
                onChanged: (String value) {},
              ).basicInput(),
              space.sizedHeight(height: 10),
              CheckboxListTile.adaptive(
                visualDensity: VisualDensity.compact,
                value: true,
                overlayColor:
                    const MaterialStatePropertyAll(AppColors.transparent),
                dense: false,
                splashRadius: 0,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.all(0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (bool? value) {},
                title: const Text('Save password'),
              ),
              space.sizedHeight(height: 10),
              PIElevatedButton(onPressed: () {}, child: const Text('Next'))
                  .expanded(context),
            ],
          ),
        ),
      ),
    );
  }
}
