import 'package:flutter/material.dart';
import 'package:privateinsta/core/utils/router.dart';
import 'package:privateinsta/src/auth/signup/views/add_profile_image.dart';
import 'package:privateinsta/src/auth/signup/views/comfirmation_otp.dart';
import 'package:privateinsta/src/auth/signup/views/sign_up_complete.dart';

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
      initialRoute: AddProfilePhoto.routeName,
    );
  }
}
