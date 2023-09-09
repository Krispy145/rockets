import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rockets/app/utils/sizes/screen_size.dart';
import 'package:rockets/app/utils/wrappers/page_transition_wrapper.dart';
import 'package:rockets/views/home/view.dart';
import 'package:rockets/views/mission/view.dart';
import 'package:rockets/views/missions/view.dart';
import 'package:rockets/views/rocket/view.dart';
import 'package:rockets/views/rockets/view.dart';

///Router class responsible for specifying routes and configuring router.
class AppRouter {
  //All route names/paths.
  // static const String main = "/";
  static const String home = "/";
  static const String slider = "/slider";
  static const String leftPanel = "/leftPanel";
  static const String rockets = "rockets";
  static const String missions = "missions";
  static const String rocket = "rocket";
  static const String mission = "mission";

  ///GoRouter configuration.
  static final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> sliderNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> leftPanelNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    // navigatorKey: mainNavigatorKey,
    routes: [
      _homeRoute(),
    ],
  );

  //Home routes.
  static ShellRoute _homeRoute() {
    return ShellRoute(navigatorKey: mainNavigatorKey, builder: (context, state, child) => child, routes: [
      GoRoute(
        path: home,
        name: home,
        parentNavigatorKey: mainNavigatorKey,
        pageBuilder: (context, state) => AppPageTransition.rightToLeft(
          key: state.pageKey,
          name: state.name,
          child: Material(
            child: Stack(
              children: [
                const HomeView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [IconButton(onPressed: () => context.pushNamed(leftPanel), icon: const Icon(Icons.home))],
                  ),
                )
              ],
            ),
          ),
        ),
        routes: <RouteBase>[
          _rocketsRoute(),
          _missionsRoute(),
        ],
      ),
      GoRoute(
        parentNavigatorKey: leftPanelNavigatorKey,
        path: leftPanel,
        name: leftPanel,
        pageBuilder: (context, state) => AppPageTransition.leftToRight(
          key: state.pageKey,
          name: state.name,
          child: Container(
            margin: EdgeInsets.only(right: screenWidth(context) / 3),
            color: Colors.blueGrey[900],
            child: Center(
              child: TextButton(
                onPressed: () => context.pushNamed(rockets),
                child: const Text("Rockets"),
              ),
            ),
          ),
        ),
      ),
      GoRoute(
        parentNavigatorKey: sliderNavigatorKey,
        path: slider,
        name: slider,
        pageBuilder: (context, state) => AppPageTransition.bottomToTop(
          key: state.pageKey,
          name: state.name,
          child: Container(
            margin: EdgeInsets.only(top: screenHeight(context) / 4),
            color: Colors.blueGrey[900],
            child: Center(
              child: TextButton(
                onPressed: () => context.pushNamed(missions),
                child: const Text("Missions"),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  //Rockets route.
  static GoRoute _rocketsRoute() {
    return GoRoute(
      parentNavigatorKey: mainNavigatorKey,
      path: rockets,
      name: rockets,
      pageBuilder: (context, state) => AppPageTransition.topToBottom(
        key: state.pageKey,
        name: state.name,
        child: Container(
          margin: EdgeInsets.only(right: screenWidth(context) / 3),
          child: const RocketsView(),
        ),
      ),
      routes: [_rocketRoute()],
    );
  }

  //Missions route.
  static GoRoute _missionsRoute() {
    return GoRoute(
      parentNavigatorKey: mainNavigatorKey,
      path: missions,
      name: missions,
      pageBuilder: (context, state) => AppPageTransition.rightToLeft(
        key: state.pageKey,
        name: state.name,
        child: Container(
          margin: EdgeInsets.only(top: screenHeight(context) / 4),
          child: const MissionsView(),
        ),
      ),
      routes: [_missionRoute()],
    );
  }

  // Rocket route.
  static GoRoute _rocketRoute() {
    return GoRoute(
      parentNavigatorKey: mainNavigatorKey,
      path: '$rocket/:id',
      name: rocket,
      builder: (context, state) {
        final String id = state.pathParameters['id'] ?? '';
        return RocketView(id: id);
      },
    );
  }

// Mission route.
  static GoRoute _missionRoute() {
    return GoRoute(
      parentNavigatorKey: mainNavigatorKey,
      path: '$mission/:id',
      name: mission,
      builder: (context, state) {
        final String id = state.pathParameters['id'] ?? '';
        return MissionView(id: id);
      },
    );
  }
}
