import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/utils/router.dart';
import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.w
          theme: ThemeData(
            bottomSheetTheme:
                const BottomSheetThemeData(backgroundColor: Colors.black54),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            textSelectionTheme:
                const TextSelectionThemeData(cursorColor: AppColors.black),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 0,
                selectedIconTheme: IconThemeData(color: Colors.black),
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(color: Colors.black),
                iconTheme: IconThemeData(color: AppColors.black)),
            inputDecorationTheme: InputDecorationTheme(
                iconColor: AppColors.black.withOpacity(0.5),
                filled: true,
                fillColor: AppColors.textFieldColor),
            useMaterial3: false,
            textTheme: GoogleFonts.nunitoSansTextTheme(
              Theme.of(context).textTheme,
            ),
            bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.black),
          ),
          darkTheme: ThemeData(
            bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: AppColors.darkFieldColor),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.white.withOpacity(0.4)),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(color: AppColors.white),
                backgroundColor: Colors.black),
            appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: AppColors.transparent,
                titleTextStyle: TextStyle(color: AppColors.white),
                iconTheme: IconThemeData(color: AppColors.white)),
            scaffoldBackgroundColor: AppColors.black,
            inputDecorationTheme: InputDecorationTheme(
                focusColor: AppColors.white.withOpacity(0.5),
                iconColor: AppColors.white.withOpacity(0.5),
                filled: true,
                fillColor: AppColors.darkFieldColor),
            brightness: Brightness.dark,
            useMaterial3: false,
          ),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute:
              AppRouter(settingsController: settingsController).generateRoute,
        );
      },
    );
  }
}
