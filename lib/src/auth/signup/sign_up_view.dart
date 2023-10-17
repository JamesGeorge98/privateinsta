import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/utils/phone_number.dart';
import 'package:privateinsta/core/utils/router.dart';
import 'package:privateinsta/src/auth/signup/bloc/sign_up_bloc.dart';
import 'package:privateinsta/src/widgets/bottom_sheets.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/page_transition.dart';
import 'package:privateinsta/src/widgets/snack_bar.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:privateinsta/src/widgets/texts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> nestedNavigatorKey =
        GlobalKey<NavigatorState>();
    return Navigator(
      key: nestedNavigatorKey,
      onGenerateRoute: AppRouter().signUpNestedRoutes,
      initialRoute: CreatePhoneNumberOrEmail.routeName,
    );
  }
}

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

class CreatePhoneNumberOrEmail extends StatelessWidget {
  const CreatePhoneNumberOrEmail({super.key});

  static const SizedBox space = SizedBox();

  static const String routeName = '/createnumberoremail';

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
              return DefaultTabController(
                length: 2,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Add phone number or email address',
                        style: PITextStyle().headerTextStyle(),
                      ),
                      TabBar(
                        indicatorColor: Theme.of(context).primaryColorLight,
                        splashBorderRadius: BorderRadius.circular(0),
                        splashFactory: NoSplash.splashFactory,
                        tabs: const <Widget>[
                          Tab(
                            child: Text('Phone'),
                          ),
                          Tab(
                            child: Text('Email'),
                          ),
                        ],
                      ),
                      space.sizedHeight(),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            phoneTab(context, state, formKey),
                            emailTab(context, state, formKey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget phoneTab(
    BuildContext context,
    SignUpState state,
    GlobalKey<FormState> formKey,
  ) {
    int? code = 0;
    return Column(
      children: <Widget>[
        PITextFormField(
          obscureText: true,
          hint: 'Phone number',
          validator: (String? value) {
            return null;
          },
          onChanged: (String value) {
            context
                .read<SignUpBloc>()
                .add(PhoneNumberFieldChnageEvent(phone: value));
          },
          onTapCountryCode: () async {
            code =
                await BottomSheets(context: context).countryCodeBottomSheets();
            print(code);
            if (context.mounted) {
              context.read<SignUpBloc>().add(
                    PhoneNumberFieldChnageEvent(countryCode: code.toString()),
                  );
            }
          },
          selectCountryCode: PhoneNumber.countriesPhoneNumberCodes[code],
        ).phoneNumberWithCountryCode(
          context,
        ),
        space.sizedHeight(height: 10),
        PIElevatedButton(
          onPressed: state.password.length < 6 ? null : () {},
          child: const Text('Next'),
        ).expanded(context),
      ],
    );
  }

  Widget emailTab(
    BuildContext context,
    SignUpState state,
    GlobalKey<FormState> formKey,
  ) {
    return Column(
      children: <Widget>[
        PITextFormField(
          obscureText: true,
          hint: 'Password',
          textEditingController: context.read<SignUpBloc>().passwordController,
          suffixIcon: state.password.isEmpty
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    context.read<SignUpBloc>().passwordController.clear();
                  },
                  child: Transform.rotate(
                    angle: 41.6,
                    child: const Icon(
                      Icons.add_circle_outline_sharp,
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
    );
  }
}
