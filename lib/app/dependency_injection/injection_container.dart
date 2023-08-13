import 'package:dio/dio.dart';
import 'package:rockets/app/flavors/flavor_config.dart';
import 'package:rockets/app/flavors/flavor_manager.dart';
import 'package:rockets/app/theme/theme_manager.dart';
import 'package:rockets/app/utils/logger/logger.dart';
import 'package:rockets/app/utils/network_info/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:rockets/blocs/home/home_bloc.dart';
import 'package:rockets/blocs/missions/missions_bloc.dart';
import 'package:rockets/blocs/rockets/rockets_bloc.dart';
import 'package:rockets/data/missions_repository.dart';
import 'package:rockets/data/rockets_repository.dart';

final Managers = ManagerInjector.instance;

class ManagerInjector {
  static final ManagerInjector instance = ManagerInjector();
  final GetIt _serviceLocator = GetIt.instance;
  final dio = Dio();

  ///Method responsible for initialising all service locator registrations.
  Future<void> init({required FlavorConfig flavorConfig}) async {
    Logger.print("Initializing ManagerInjector...", [LoggerFeature.dependancyInjection]);

    // Core
    initCore(flavorConfig: flavorConfig);

    // External
    Logger.print("Initializing external services...", [LoggerFeature.dependancyInjection]);
    await initExternal();
    Logger.print("ManagerInjector initialization complete.", [LoggerFeature.dependancyInjection]);
  }

  ///Method responsible for handling all service locator registrations for core
  ///classes used in multiple features.
  void initCore({required FlavorConfig flavorConfig}) {
    _serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(_serviceLocator()));
    _serviceLocator.registerLazySingleton<FlavorManager>(() => FlavorManager(flavorConfig: flavorConfig));
    _serviceLocator.registerLazySingleton<ThemeManager>(() => ThemeManager());
  }

  ///Method responsible for handling all service locator registrations for external
  ///services.
  Future<void> initExternal() async {
    //Blocs
    _serviceLocator.registerLazySingleton<HomeBloc>(() => HomeBloc());
    _serviceLocator.registerLazySingleton<RocketsBloc>(() => RocketsBloc());
    _serviceLocator.registerLazySingleton<MissionsBloc>(() => MissionsBloc());

    //Repositories
    _serviceLocator.registerLazySingleton<ApiRocketsRepository>(() => ApiRocketsRepository(dio));
    _serviceLocator.registerLazySingleton<ApiMissionsRepository>(() => ApiMissionsRepository(dio));

    //Other
    _serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
  }

  // Getters for all services
  //Managers
  FlavorManager get _flavor => _serviceLocator.get<FlavorManager>();
  ThemeManager get theme => _serviceLocator.get<ThemeManager>();
  FlavorConfig get flavor => _flavor.flavorConfig;

  //Blocs
  HomeBloc get homeBloc => _serviceLocator.get<HomeBloc>();
  RocketsBloc get rocketsBloc => _serviceLocator.get<RocketsBloc>();
  MissionsBloc get missionsBloc => _serviceLocator.get<MissionsBloc>();

  //Repositories
  ApiRocketsRepository get rocketsApi => _serviceLocator.get<ApiRocketsRepository>();
  ApiMissionsRepository get missionsApi => _serviceLocator.get<ApiMissionsRepository>();
}
