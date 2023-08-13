import 'package:flutter_test/flutter_test.dart';
import 'package:rockets/app/flavors/flavor_config.dart';

import 'package:rockets/main.dart';

void main() {
  final FlavorConfig flavorConfig = FlavorConfig(
    environment: Environment.dev,
    apiPrefix: "https://api.spacexdata.com/v3",
  );
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App(
      flavorConfig: flavorConfig,
    ));
  });
}
