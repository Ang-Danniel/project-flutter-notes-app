import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Nunito",
        fontSize: 44,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      displayLarge: TextStyle(
        fontFamily: "Nunito",
        fontSize: 40,
        color: AppColor.hintTextColor,
      ),
      displaySmall: TextStyle(
        fontFamily: "Nunito",
        fontSize: 24,
        color: AppColor.hintTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Nunito",
        fontSize: 40,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: "Nunito",
        fontSize: 24,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontFamily: "Nunito",
        color: Colors.black,
        fontSize: 16,
      ),
    ),
  );
}

const ColorScheme darkColorScheme = ColorScheme.dark(
  surface: Color.fromARGB(255, 37, 37, 37),
  primary: Color.fromRGBO(255, 158, 100, 1),
  onPrimary: Colors.white,
  onSurface: Colors.white,
);

class AppColor {
  static const white = Colors.white;
  static const searchTextColor = Color.fromRGBO(204, 204, 204, 1);
  static const hintTextColor = Color.fromRGBO(147, 147, 147, 1);
  static const acceptButtonColor = Colors.green;
  static const rejectButonColor = Colors.red;
  static const cursorColor = Color.fromRGBO(255, 255, 255, 0.7);
  static const barrierColor = Color.fromRGBO(196, 196, 196, 0.1);
  static const searchBarColor = Color.fromRGBO(56, 56, 56, 1);
}
