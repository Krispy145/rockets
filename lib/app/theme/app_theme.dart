import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';

class AppTheme {
  static final ThemeData currentTheme = Managers.theme.themeMode == ThemeMode.light ? lightTheme : darkTheme;

  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      secondary: Colors.transparent,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color(0xFFB5CC39), //Yellow/Green Combo
    cupertinoOverrideTheme: const CupertinoThemeData(primaryColor: Color(0xFFB5CC39)),
    disabledColor: const Color(0xFF757575), // Gray
    dividerColor: const Color(0xFF424242), // Dark Gray
    secondaryHeaderColor: const Color(0xFF9E9E9E), // Light Gray
    hintColor: const Color(0xFF9E9E9E), // Light Gray
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      titleTextStyle: GoogleFonts.orbitron(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.white.withOpacity(0.2),
      selectionHandleColor: Colors.white,
    ),
    textTheme: GoogleFonts.orbitronTextTheme(
      _getTextTheme(Colors.white),
    ),
    elevatedButtonTheme: _getButtonTheme,
    cardColor: const Color(0xFFB5CC39),
  );

  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      secondary: Colors.transparent,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xffdcdcdc), // Dull Light Gray
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: const Color(0xFFB5CC39), //Yellow/Green Combo
    cupertinoOverrideTheme: const CupertinoThemeData(primaryColor: Color(0xFFB5CC39)),
    disabledColor: const Color(0xFFBDBDBD), // Light Gray
    dividerColor: const Color(0xFFE0E0E0), // Light Gray
    secondaryHeaderColor: const Color(0xFF757575), // Gray
    hintColor: const Color(0xFF757575), // Gray
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xffdcdcdc), // Dull Light Gray
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      titleTextStyle: GoogleFonts.orbitron(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.black.withOpacity(0.1),
      selectionHandleColor: Colors.black,
    ),
    textTheme: GoogleFonts.orbitronTextTheme(
      _getTextTheme(Colors.black),
    ),
    elevatedButtonTheme: _getButtonTheme,
    cardColor: const Color(0xFFB5CC39),
  );

  static TextTheme _getTextTheme(Color color) {
    return TextTheme(
      titleLarge: TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w600),
      displayLarge: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w500),
      displayMedium: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w500),
      displaySmall: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w400),
    );
  }

  static ElevatedButtonThemeData get _getButtonTheme => const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xFFB5CC39)), //Yellow/Green Combo
          iconColor: MaterialStatePropertyAll(Colors.white),
        ),
      );
}
