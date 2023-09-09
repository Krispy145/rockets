import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';

import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/flavors/flavor_config.dart';
import 'package:rockets/app/router/app_router.dart';
import 'package:rockets/app/theme/app_theme.dart';
import 'package:rockets/app/theme/theme_manager.dart';

void appMain({required FlavorConfig flavorConfig}) async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  Managers.init(flavorConfig: flavorConfig);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ChangeNotifierProvider<ThemeManager>(
      create: (_) => Managers.theme,
      child: App(flavorConfig: flavorConfig),
    ),
  );
}

class App extends StatelessWidget {
  final FlavorConfig flavorConfig;

  const App({Key? key, required this.flavorConfig}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return MaterialApp.router(
          title: 'Rockets',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeManager.themeMode,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
