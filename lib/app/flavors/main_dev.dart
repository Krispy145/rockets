import 'package:rockets/app/flavors/flavor_config.dart';
import 'package:rockets/main.dart';

void main() {
  final FlavorConfig flavorConfig = FlavorConfig(
    environment: Environment.dev,
    apiPrefix: "https://api.spacexdata.com/v3",
  );
  appMain(flavorConfig: flavorConfig);
}
