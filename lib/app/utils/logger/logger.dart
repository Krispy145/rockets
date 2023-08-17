import 'package:flutter/material.dart';

///Enum responsible for storing feature references.
enum LoggerFeature {
  navigation,
  dependancyInjection,
  rockets,
  missions,
  theme;

  ///Method responsible for determining whether logs should be printed.
  bool get shouldPrint {
    switch (this) {
      case LoggerFeature.navigation:
        return true;
      case LoggerFeature.dependancyInjection:
        return true;
      case LoggerFeature.rockets:
        return true;
      case LoggerFeature.missions:
        return true;
      case LoggerFeature.theme:
        return true;
    }
  }

  ///Method responsible for making logs more readable.
  String get string {
    switch (this) {
      case LoggerFeature.navigation:
        return "NAVIGATION";
      case LoggerFeature.dependancyInjection:
        return "INJECTION";
      case LoggerFeature.rockets:
        return "ROCKETS";
      case LoggerFeature.missions:
        return "MISSIONS";
      case LoggerFeature.theme:
        return "THEME";
    }
  }
}

///Class responsible for logging.
class Logger {
  ///Method responsible for printing log to the console.
  static void print(
    String text,
    List<LoggerFeature> features,
  ) {
    final List<String> activeFeatures = [];
    for (LoggerFeature feature in features) {
      if (feature.shouldPrint) {
        activeFeatures.add(feature.string);
      }
    }
    if (activeFeatures.isNotEmpty) {
      debugPrint("Features (${activeFeatures.join(', ')}): $text");
    }
  }
}
