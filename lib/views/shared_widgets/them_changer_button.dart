import 'package:flutter/material.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';

class ThemeChangerButton extends StatelessWidget {
  const ThemeChangerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Managers.theme.isDarkMode,
      builder: (context, isDarkMode, child) => IconButton(
        onPressed: () => Managers.theme.toggleTheme(),
        icon: Icon(
          isDarkMode ? Icons.dark_mode : Icons.sunny,
        ),
      ),
    );
  }
}
