import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rockets/app/utils/sizes/edge_insets.dart';
import 'package:rockets/app/utils/sizes/screen_size.dart';
import 'package:rockets/app/utils/sizes/spacers.dart';
import 'package:rockets/app/router/app_router.dart';
import 'package:rockets/views/shared_widgets/them_changer_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home View'),
          actions: const [
            ThemeChangerButton(),
          ],
        ),
        body: Padding(
          padding: AppEdgeInsets.all(context, Sizes.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Sizes.s.spacer(),
              ElevatedButton(
                // onPressed: () => context.goNamed(AppRouter.rockets),
                onPressed: () => AppRouter.nestedNavigatorsKey.currentState?.toggleBottomToTop(),
                child: const Text('Slider'),
              ),
              Sizes.s.spacer(),
              ElevatedButton(
                onPressed: () => AppRouter.nestedNavigatorsKey.currentState?.toggleLeftToRight(),
                child: const Text('Left Panel'),
              ),
            ],
          ),
        ));
  }
}

class NestedNavigators extends StatefulWidget {
  const NestedNavigators({super.key});

  @override
  State<NestedNavigators> createState() => NestedNavigatorsState();
}

class NestedNavigatorsState extends State<NestedNavigators> {
  bool isLeftToRightVisible = false;
  bool isRightToLeftVisible = false;
  bool isBottomToTopVisible = false;

  void toggleLeftToRight() {
    setState(() {
      isLeftToRightVisible = !isLeftToRightVisible;
    });
  }

  void toggleRightToLeft() {
    setState(() {
      isRightToLeftVisible = !isRightToLeftVisible;
    });
  }

  void toggleBottomToTop() {
    setState(() {
      isBottomToTopVisible = !isBottomToTopVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          left: isLeftToRightVisible ? 0 : -screenWidth(context) * (2 / 3),
          duration: const Duration(milliseconds: 300),
          child: Builder(builder: (context) {
            return SizedBox(
              width: screenWidth(context) * (2 / 3),
              height: screenHeight(context),
              child: Navigator(
                  key: AppRouter.leftPanelNavigatorKey,
                  onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => Container(
                          color: Colors.blueGrey[900],
                          child: Center(
                            child: TextButton(
                              onPressed: () => context.pushNamed(AppRouter.missions),
                              child: const Text("Missions"),
                            ),
                          ),
                        ),
                      )),
            );
          }),
        ),
        AnimatedPositioned(
          bottom: isBottomToTopVisible ? 0 : -screenHeight(context) * (2 / 3),
          duration: const Duration(milliseconds: 300),
          child: Builder(builder: (context) {
            return SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * (2 / 3),
              child: Navigator(
                  key: AppRouter.sliderNavigatorKey,
                  onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => Container(
                          color: Colors.blueGrey[900],
                          child: Center(
                            child: TextButton(
                              onPressed: () => context.pushNamed(AppRouter.rockets),
                              child: const Text("Rockets"),
                            ),
                          ),
                        ),
                      )),
            );
          }),
        ),
        AnimatedPositioned(
          right: isRightToLeftVisible ? 0 : -screenWidth(context) * (2 / 3),
          duration: const Duration(milliseconds: 300),
          child: Builder(builder: (context) {
            return SizedBox(
              width: screenWidth(context) * (2 / 3),
              height: screenHeight(context),
              child: Navigator(
                  key: AppRouter.rightPanelNavigatorKey,
                  onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => Container(
                          color: Colors.blue,
                        ),
                      )),
            );
          }),
        ),
      ],
    );
  }
}
