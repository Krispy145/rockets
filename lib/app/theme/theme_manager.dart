import 'package:flutter/material.dart';
import 'package:rockets/app/utils/logger/logger.dart';

///Class responsible for providing the theme to other widgets in the app.
class ThemeManager extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ValueNotifier<bool> isDarkMode = ValueNotifier(true);

  ///Getter responsible for determining the theme.
  ThemeMode get themeMode => _themeMode;

  ///Method responsible for toggling the theme.
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    isDarkMode.value = _themeMode == ThemeMode.dark;
    Logger.print("Theme Set: $_themeMode", [LoggerFeature.theme]);
    notifyListeners();
  }
}
