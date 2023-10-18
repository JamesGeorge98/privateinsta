import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privateinsta/src/auth/auth_repo.dart';
import 'package:privateinsta/src/auth/sigin/bloc/sigin_bloc.dart';
import 'package:privateinsta/src/auth/sigin/signin_view.dart';
import 'package:privateinsta/src/auth/signup/bloc/sign_up_bloc.dart';
import 'package:privateinsta/src/auth/signup/sign_up_view.dart';
import 'package:privateinsta/src/auth/signup/views/create_email_number.dart';
import 'package:privateinsta/src/auth/signup/views/create_password.dart';
import 'package:privateinsta/src/auth/signup/views/create_username.dart';
import 'package:privateinsta/src/main_screen/discover/discover_view.dart';
import 'package:privateinsta/src/main_screen/home/home_view.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';
import 'package:privateinsta/src/main_screen/post/post_view.dart';
import 'package:privateinsta/src/main_screen/profile/profile_view.dart';
import 'package:privateinsta/src/main_screen/reels/reels_view.dart';
import 'package:privateinsta/src/messages/messages_view.dart';
import 'package:privateinsta/src/notification/notification_view.dart';
import 'package:privateinsta/src/sample_feature/sample_item_details_view.dart';
import 'package:privateinsta/src/sample_feature/sample_item_list_view.dart';
import 'package:privateinsta/src/settings/settings_controller.dart';
import 'package:privateinsta/src/settings/settings_view.dart';
import 'package:privateinsta/src/widgets/page_transition.dart';

class AppRouter {
  AppRouter({
    this.settingsController,
  });
  final SettingsController? settingsController;
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      /// settings Routes ====================================================
      case SettingsView.routeName:
        return PIPageRoute(
          child: SettingsView(controller: settingsController!),
          settings: routeSettings,
        );

      case SampleItemDetailsView.routeName:
        return PIPageRoute(
          child: const SampleItemDetailsView(),
          settings: routeSettings,
        );

      /// Auth Routes ========================================================
      case SigInScreen.routeName:
        return PIPageRoute(
          child: RepositoryProvider<AuthenticationRepository>(
            create: (BuildContext context) => AuthenticationRepository(),
            child: BlocProvider<SiginBloc>(
              create: (BuildContext context) => SiginBloc(
                authService: RepositoryProvider.of<AuthenticationRepository>(
                  context,
                ),
              ),
              child: const SigInScreen(),
            ),
          ),
          settings: routeSettings,
          direction: AxisDirection.up,
        );

      case SignUpScreen.routeName:
        return PIPageRoute(
          child: RepositoryProvider<AuthenticationRepository>(
            create: (BuildContext context) => AuthenticationRepository(),
            child: BlocProvider<SignUpBloc>(
              create: (BuildContext context) => SignUpBloc(
                authService: RepositoryProvider.of<AuthenticationRepository>(
                  context,
                ),
              ),
              child: const SignUpScreen(),
            ),
          ),
          settings: routeSettings,
          direction: AxisDirection.up,
        );

      /// Home Screen Routes =================================================
      ///
      case BottomTabScreens.routeName:
        return PIPageRoute(
          child: const BottomTabScreens(),
          settings: routeSettings,
          direction: AxisDirection.left,
        );

      case MainScreen.routeName:
        return PIPageRoute(
          child: const MainScreen(),
          settings: routeSettings,
        );

      case HomeScreen.routeName:
        return PIPageRoute(
          child: const HomeScreen(),
          settings: routeSettings,
        );

      case DiscoverScreen.routeName:
        return PIPageRoute(
          child: const DiscoverScreen(),
          settings: routeSettings,
        );

      case PostScreen.routeName:
        return PIPageRoute(
          child: const PostScreen(),
          settings: routeSettings,
        );

      case ReelsScreen.routeName:
        return PIPageRoute(
          child: const ReelsScreen(),
          settings: routeSettings,
        );

      case ProfilePage.routeName:
        return PIPageRoute(
          child: const ProfilePage(),
          settings: routeSettings,
        );

      //

      case MessagesScreen.routeName:
        return PIPageRoute(
          child: const MessagesScreen(),
          settings: routeSettings,
          direction: AxisDirection.left,
        );

      case NotificationScreen.routeName:
        return PIPageRoute(
          child: const NotificationScreen(),
          settings: routeSettings,
          direction: AxisDirection.left,
        );

      case SampleItemListView.routeName:
      default:
        return PIPageRoute(
          child: RepositoryProvider<AuthenticationRepository>(
            create: (BuildContext context) => AuthenticationRepository(),
            child: BlocProvider<SiginBloc>(
              create: (BuildContext context) => SiginBloc(
                authService: RepositoryProvider.of<AuthenticationRepository>(
                  context,
                ),
              ),
              child: const SigInScreen(),
            ),
          ),
          settings: routeSettings,
          direction: AxisDirection.up,
        );
    }
  }

  Route<dynamic> signUpNestedRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CreateUserName.routeName:
        return PIPageRoute(
          child: const CreateUserName(),
          settings: routeSettings,
        );
      case CreatePassword.routeName:
        return PIPageRoute(
          child: const CreatePassword(),
          settings: routeSettings,
        );
      case CreatePhoneNumberOrEmail.routeName:
        return PIPageRoute(
          child: const CreatePhoneNumberOrEmail(),
          settings: routeSettings,
        );
      default:
        return PIPageRoute(
          child: const CreateUserName(),
          settings: routeSettings,
        );
    }
  }
}
