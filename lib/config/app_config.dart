import 'dart:ui';

import 'flavor_config.dart';

class AppConfig {
  static void configure({required Flavor flavor}) {
    switch (flavor) {
      case Flavor.development:
        FlavorConfig(
          flavor: flavor,
          name: "Battery Monitor Dev",
          primaryColor: const Color(0xFF4CAF50),
          secondaryColor: const Color(0xFF8BC34A),
          showDebugBanner: false,
        );
        break;
      case Flavor.staging:
        FlavorConfig(
          flavor: flavor,
          name: "Battery Monitor Staging",
          primaryColor: const Color(0xFFFF9800),
          secondaryColor: const Color(0xFFFFC107),
          showDebugBanner: false,
        );
        break;
      case Flavor.production:
        FlavorConfig(
          flavor: flavor,
          name: "Battery Monitor",
          primaryColor: const Color(0xFF4366F7),
          secondaryColor: const Color(0xFF6C8DFA),
          showDebugBanner: false,
        );
        break;
    }
  }
}
