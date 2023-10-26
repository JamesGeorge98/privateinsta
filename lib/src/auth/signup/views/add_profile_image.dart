import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/auth/signup/bloc/sign_up_bloc.dart';
import 'package:privateinsta/src/widgets/bottom_sheets.dart';

import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/textformfields.dart';
import 'package:privateinsta/src/widgets/texts.dart';

class AddProfilePhoto extends StatelessWidget {
  const AddProfilePhoto({super.key});

  static const SizedBox space = SizedBox();

  static const String routeName = '/addprofilephoto';

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: BlocConsumer<SignUpBloc, SignUpState>(
              listener: (BuildContext context, SignUpState state) {},
              builder: (BuildContext context, SignUpState state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const LinearGradient(
                        colors: <Color>[
                          AppColors.instaSandle,
                          AppColors.instaOrange,
                          AppColors.instaPink,
                          AppColors.instaPurple,
                        ],
                      ).createShader(bounds),
                      child: const Stack(
                        children: <Widget>[
                          Icon(
                            AppIcons.profile,
                            size: 100,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                Icons.add_circle_outline_outlined,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    space.sizedHeight(),
                    Text(
                      'Welcome To Instagram James George',
                      style: PITextStyle().headerTextStyle(),
                    ),
                    space.sizedHeight(),
                    PIElevatedButton(
                      onPressed: () {
                        BottomSheets(context: context).takeaPhotoBottomSheet();
                      },
                      child: const Text('Complete Sign-up'),
                    ).expanded(context),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
