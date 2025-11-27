import 'dart:ui';

enum Flavor { development, staging, production }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color primaryColor;
  final Color secondaryColor;
  final bool showDebugBanner;

  static FlavorConfig? _instance;

  FlavorConfig._({
    required this.flavor,
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
    required this.showDebugBanner,
  });

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required Color primaryColor,
    required Color secondaryColor,
    required bool showDebugBanner,
  }) {
    _instance ??= FlavorConfig._(
      flavor: flavor,
      name: name,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      showDebugBanner: showDebugBanner,
    );
    return _instance!;
  }

  static FlavorConfig get instance {
    return _instance!;
  }

  bool get isDevelopment => flavor == Flavor.development;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProduction => flavor == Flavor.production;
}
