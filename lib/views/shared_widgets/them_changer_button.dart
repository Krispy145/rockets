import 'package:flutter/material.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/utils/sizes/edge_insets.dart';
import 'package:rockets/app/utils/sizes/spacers.dart';

class ThemeChangerButton extends StatefulWidget {
  const ThemeChangerButton({super.key});

  @override
  State<ThemeChangerButton> createState() => _ThemeChangerButtonState();
}

class _ThemeChangerButtonState extends State<ThemeChangerButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isDarkMode = Managers.theme.isDarkMode.value;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    Managers.theme.toggleTheme();
    isDarkMode = !isDarkMode;
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * (isDarkMode ? 1 : -1) * 0.5 * 25,
          child: IconButton(
            onPressed: _toggleTheme,
            padding: AppEdgeInsets.symmetric(context, horizontal: Sizes.l),
            icon: Icon(
              isDarkMode ? Icons.dark_mode : Icons.sunny,
            ),
          ),
        );
      },
    );
  }
}
