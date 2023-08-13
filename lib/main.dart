import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/flavors/flavor_config.dart';
import 'package:rockets/app/router/app_router.dart';
import 'package:rockets/app/theme/app_theme.dart';

void appMain({required FlavorConfig flavorConfig}) async {
  WidgetsFlutterBinding.ensureInitialized();
  Managers.init(flavorConfig: flavorConfig);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App(flavorConfig: flavorConfig));
}

class App extends StatelessWidget {
  final FlavorConfig flavorConfig;

  const App({Key? key, required this.flavorConfig}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rockets',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Managers.theme.themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
