import 'package:flutter/material.dart';
import 'package:privateinsta/src/auth/login/login_view.dart';
import 'package:privateinsta/src/auth/signup/signup_view.dart';
import 'package:privateinsta/src/main_screen/discover/discover_view.dart';
import 'package:privateinsta/src/main_screen/home/home_view.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';
import 'package:privateinsta/src/main_screen/post/post_view.dart';
import 'package:privateinsta/src/main_screen/profile/profile_view.dart';
import 'package:privateinsta/src/main_screen/reels/reels_view.dart';
import 'package:privateinsta/src/messages/messages_view.dart';
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
      /// settings Routes ====================================================
      case SettingsView.routeName:
        return PIPageRoute(
            child: SettingsView(controller: settingsController),
            settings: routeSettings);

      case SampleItemDetailsView.routeName:
        return PIPageRoute(
            child: const SampleItemDetailsView(), settings: routeSettings);

      /// Auth Routes ========================================================
      case LoginScreen.routeName:
        return PIPageRoute(
            child: const LoginScreen(),
            settings: routeSettings,
            direction: AxisDirection.up);

      case SignUpScreen.routeName:
        return PIPageRoute(
            child: const SignUpScreen(),
            settings: routeSettings,
            direction: AxisDirection.up);

      /// Home Screen Routes =================================================
      /// 
       case BottomTabScreens.routeName:
        return PIPageRoute(
            child: const BottomTabScreens(),
            settings: routeSettings,
            direction: AxisDirection.left);

      case MainScreen.routeName:
        return PIPageRoute(
            child: const MainScreen(),
            settings: routeSettings,
            direction: AxisDirection.right);

      case HomeScreen.routeName:
        return PIPageRoute(
            child: const HomeScreen(),
            settings: routeSettings,
            direction: AxisDirection.right);

      case DiscoverScreen.routeName:
        return PIPageRoute(
            child: const DiscoverScreen(),
            settings: routeSettings,
            direction: AxisDirection.right);

      case PostScreen.routeName:
        return PIPageRoute(
            child: const PostScreen(),
            settings: routeSettings,
            direction: AxisDirection.right);

      case ReelsScreen.routeName:
        return PIPageRoute(
            child: const ReelsScreen(),
            settings: routeSettings,
            direction: AxisDirection.right);

      case ProfilePage.routeName:
        return PIPageRoute(
            child: const ProfilePage(),
            settings: routeSettings,
            direction: AxisDirection.right);

      //

      case MessagesScreen.routeName:
        return PIPageRoute(
            child: const MessagesScreen(),
            settings: routeSettings,
            direction: AxisDirection.left);

      case SampleItemListView.routeName:
      default:
        return PIPageRoute(child: const LoginScreen(), settings: routeSettings);
    }
  }
}
