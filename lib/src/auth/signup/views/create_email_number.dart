import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/utils/phone_number.dart';
import 'package:privateinsta/src/auth/signup/bloc/sign_up_bloc.dart';

import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:privateinsta/src/widgets/texts.dart';

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
        child: DefaultTabController(
          length: 2,
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
                        'Add phone number or email address',
                        style: PITextStyle().headerTextStyle(),
                      ),
                      Container(
                        constraints: const BoxConstraints(),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.grey.withOpacity(0.5),
                              width: 2,
                            ),
                          ),
                        ),
                        child: TabBar(
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
                      ),
                      space.sizedHeight(),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            phoneTab(context, state),
                            emailTab(context, state),
                          ],
                        ),
                      ),
                      PIElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: const Text('Next'),
                      ).expanded(context),
                      const Spacer(
                        flex: 7,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget phoneTab(
    BuildContext context,
    SignUpState state,
  ) {
    return Column(
      children: <Widget>[
        PIPhoneNumberTextField(
          textEditingController: context.read<SignUpBloc>().phoneController,
          suffixIcon: state.phoneNumber == null ||
                  state.phoneNumber!.phoneNumber!.isEmpty
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    context.read<SignUpBloc>().phoneController.clear();
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
          hint: 'Phone number',
          onChanged: (PhoneNumber value) {
            context.read<SignUpBloc>().add(
                  PhoneNumberFieldChnageEvent(
                    phoneNumber: value,
                  ),
                );
          },
        ),
        space.sizedHeight(height: 10),
      ],
    );
  }

  Widget emailTab(
    BuildContext context,
    SignUpState state,
  ) {
    return Column(
      children: <Widget>[
        PITextFormField(
          hint: 'Email',
          validator: (String? value) {
            if (!value!.isValidEmail) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          textEditingController: context.read<SignUpBloc>().emailController,
          suffixIcon: context.read<SignUpBloc>().emailController.text.isEmpty
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    context.read<SignUpBloc>().emailController.clear();
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
      ],
    );
  }
}

