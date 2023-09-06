import 'package:flutter/material.dart';
import 'package:privateinsta/src/auth/login/login_view.dart';
import 'package:privateinsta/src/auth/signup/signup_view.dart';
import 'package:privateinsta/src/main_screen/home/home_view.dart';
import 'package:privateinsta/src/sample_feature/sample_item_details_view.dart';
import 'package:privateinsta/src/sample_feature/sample_item_list_view.dart';
import 'package:privateinsta/src/settings/settings_controller.dart';
import 'package:privateinsta/src/settings/settings_view.dart';
import 'package:privateinsta/src/widgets/page_transition.dart';

class AppRouter {
  AppRouter({
    required this.settingsController,
  });
  final SettingsController settingsController;
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SettingsView.routeName:
        return PIPageRoute(
            child: SettingsView(controller: settingsController),
            settings: routeSettings);
      case SampleItemDetailsView.routeName:
        return PIPageRoute(
            child: const SampleItemDetailsView(), settings: routeSettings);
      case SignUpScreen.routeName:
        return PIPageRoute(
            child: const SignUpScreen(),
            settings: routeSettings,
            direction: AxisDirection.up);
      case HomeScreen.routeName:
        return PIPageRoute(
            child: const HomeScreen(),
            settings: routeSettings,
            direction: AxisDirection.right);
      case SampleItemListView.routeName:
      default:
        return PIPageRoute(child: const LoginScreen(), settings: routeSettings);
    }
  }
}
