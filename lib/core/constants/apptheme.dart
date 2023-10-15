import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:privateinsta/core/constants/colors.dart';
// import 'package:privateinsta/core/utils/keys.dart';

class AppThemes {
  AppThemes();

  static ThemeData lightTheme() {
    //final BuildContext globalContext = AppKeys.navigatorKey.currentContext!;
    return ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: AppColors.black),
      ),

      bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.black),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        selectedIconTheme: IconThemeData(color: Colors.black),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),

      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.black54),

      checkboxTheme: const CheckboxThemeData(
        fillColor: MaterialStatePropertyAll<Color?>(AppColors.blue),
        checkColor: MaterialStatePropertyAll<Color?>(AppColors.white),
      ),

      highlightColor: Colors.transparent,

      inputDecorationTheme: InputDecorationTheme(
        iconColor: AppColors.black.withOpacity(0.5),
        filled: true,
        fillColor: AppColors.textFieldColor,
      ),

      snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.white70),

      splashColor: Colors.transparent,

      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.black),

      // textTheme: GoogleFonts.nunitoSansTextTheme(
      //   Theme.of(globalContext).textTheme,
      // ),

      useMaterial3: false,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        titleTextStyle: TextStyle(color: AppColors.white),
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: Colors.black,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.darkFieldColor,
      ),
      checkboxTheme: const CheckboxThemeData(
        checkColor: MaterialStatePropertyAll<Color?>(AppColors.darkFieldColor),
      ),
      highlightColor: Colors.transparent,
      inputDecorationTheme: InputDecorationTheme(
        focusColor: AppColors.white.withOpacity(0.5),
        iconColor: AppColors.white.withOpacity(0.5),
        filled: true,
        fillColor: AppColors.darkFieldColor,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.white.withOpacity(0.4),
      ),
      scaffoldBackgroundColor: AppColors.black,
      snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.teal),
      splashColor: Colors.transparent,
      useMaterial3: false,
    );
  }
}
