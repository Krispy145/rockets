import 'package:go_router/go_router.dart';
import 'package:rockets/views/home/view.dart';
import 'package:rockets/views/mission/view.dart';
import 'package:rockets/views/missions/view.dart';
import 'package:rockets/views/rocket/view.dart';
import 'package:rockets/views/rockets/view.dart';

///Router class responsible for specifying routes and configuring router.
class AppRouter {
  //All route names/paths.
  static const String home = "/";
  static const String rockets = "rockets";
  static const String missions = "missions";
  static const String rocket = "rocket";
  static const String mission = "mission";

  ///GoRouter configuration.
  static final router = GoRouter(
    routes: [
      _homeRoute(),
    ],
  );

  //Home routes.
  static GoRoute _homeRoute() {
    return GoRoute(
      path: home,
      name: home,
      builder: (context, state) => const HomeView(),
      routes: [_rocketsRoute(), _missionsRoute()],
    );
  }

  //Rockets route.
  static GoRoute _rocketsRoute() {
    return GoRoute(
      path: rockets,
      name: rockets,
      builder: (context, state) => const RocketsView(),
      routes: [_rocketRoute()],
    );
  }

  //Missions route.
  static GoRoute _missionsRoute() {
    return GoRoute(
      path: missions,
      name: missions,
      builder: (context, state) => const MissionsView(),
      routes: [_missionRoute()],
    );
  }

  // Rocket route.
  static GoRoute _rocketRoute() {
    return GoRoute(
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
      path: '$mission/:id',
      name: mission,
      builder: (context, state) {
        final String id = state.pathParameters['id'] ?? '';
        return MissionView(id: id);
      },
    );
  }
}
