import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/utils/sizes/edge_insets.dart';
import 'package:rockets/app/utils/sizes/spacers.dart';
import 'package:rockets/app/router/app_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: Managers.theme.isDarkMode,
            builder: (context, isDarkMode, child) => IconButton(
              onPressed: () => Managers.theme.toggleTheme(),
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.sunny,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: AppEdgeInsets.all(context, Sizes.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Sizes.s.spacer(),
            ElevatedButton(
              onPressed: () => context.goNamed(AppRouter.rockets),
              child: const Text('Rockets'),
            ),
            Sizes.s.spacer(),
            ElevatedButton(
              onPressed: () => context.goNamed(AppRouter.missions),
              child: const Text('Missions'),
            ),
          ],
        ),
      ),
    );
  }
}
