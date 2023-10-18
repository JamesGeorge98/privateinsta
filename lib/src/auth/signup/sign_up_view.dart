import 'package:flutter/material.dart';
import 'package:privateinsta/core/utils/router.dart';
import 'package:privateinsta/src/auth/signup/views/create_email_number.dart';

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
