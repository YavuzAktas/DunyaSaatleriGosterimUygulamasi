import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xFFFAFCFF);
  static Color lightPrimaryColor = const Color(0XFFE3EEFF);
  static Color lightSecondaryColor = const Color(0XFF002359);
  static Color lightTextColor = const Color(0XFF002359);
  static Color strokeBlue = const Color(0xFF8FAFE0);

  const AppTheme._();

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: lightPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(backgroundColor: lightPrimaryColor),
      colorScheme: ColorScheme.light(
        secondary: lightSecondaryColor,
        background: lightBackgroundColor,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: lightTextColor)));

  static Brightness get currentSystemBrightness =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: lightBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}
