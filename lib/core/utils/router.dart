import 'package:flutter/material.dart';
import 'package:privateinsta/src/auth/login/login_view.dart';
import 'package:privateinsta/src/auth/signup/signup_view.dart';
import 'package:privateinsta/src/sample_feature/sample_item_details_view.dart';
import 'package:privateinsta/src/sample_feature/sample_item_list_view.dart';
import 'package:privateinsta/src/settings/settings_controller.dart';
import 'package:privateinsta/src/settings/settings_view.dart';

class AppRouter {
  AppRouter({
    required this.settingsController,
  });
  final SettingsController settingsController;
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case SettingsView.routeName:
            return SettingsView(controller: settingsController);
          case SampleItemDetailsView.routeName:
            return const SampleItemDetailsView();
          case SignUpScreen.routeName:
            return const SignUpScreen();
          case SampleItemListView.routeName:
          default:
            return const LoginScreen();
        }
      },
    );
  }
}
