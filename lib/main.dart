import 'package:batterylearn/features/home/controllers/battery_controller.dart';
import 'package:batterylearn/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'config/flavor_config.dart';
import 'config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('flavor', defaultValue: 'development');

  switch (flavor) {
    case 'staging':
      AppConfig.configure(flavor: Flavor.staging);
      break;
    case 'production':
      AppConfig.configure(flavor: Flavor.production);
      break;
    default:
      AppConfig.configure(flavor: Flavor.development);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final config = FlavorConfig.instance;

    return ChangeNotifierProvider(
      create: (context) => BatteryController()..initializeBatteryData(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
          title: config.name,
          debugShowCheckedModeBanner: config.showDebugBanner,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: config.primaryColor,
              brightness: Brightness.dark,
            ),
            fontFamily: 'Inter',
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: config.primaryColor,
              brightness: Brightness.dark,
            ),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
