import 'package:flutter/cupertino.dart';
import 'package:rockets/app/flavors/flavor_config.dart';

class FlavorManager extends ChangeNotifier {
  final FlavorConfig flavorConfig;

  FlavorManager({required this.flavorConfig});
}
