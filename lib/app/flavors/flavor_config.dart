enum Environment { dev, prod }

class FlavorConfig {
  final Environment environment;
  final String apiPrefix;

  FlavorConfig({required this.environment, required this.apiPrefix});
}
