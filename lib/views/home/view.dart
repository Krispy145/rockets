import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rockets/app/helpers/sizes/spacers.dart';
import 'package:rockets/app/router/app_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home View')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
