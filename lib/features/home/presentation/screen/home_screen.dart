import 'dart:math';

import 'package:battery_plus/battery_plus.dart';
import 'package:batterylearn/features/home/controllers/battery_controller.dart';
import 'package:batterylearn/features/home/presentation/widget/action_buttons_widget.dart';
import 'package:batterylearn/features/home/presentation/widget/battery_icon_widget.dart';
import 'package:batterylearn/features/home/presentation/widget/battery_level_card.dart';
import 'package:batterylearn/features/home/presentation/widget/battery_status_card.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Battery Monitor',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        actions: [
          Consumer<BatteryController>(
            builder: (context, batteryController, child) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: batteryController.refreshBatteryData,
                tooltip: 'Refresh',
              );
            },
          ),
        ],
      ),
      body: Stack(children: [const HomeScreenBody(), _buildConfetti()]),
    );
  }

  Widget _buildConfetti() {
    return Align(
      alignment: Alignment.topCenter,
      child: Consumer<BatteryController>(
        builder: (context, batteryController, child) {
          return ConfettiWidget(
            confettiController: batteryController.confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple,
            ],
            createParticlePath: drawStar,
          );
        },
      ),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BatteryController>(
      builder: (context, batteryController, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (batteryController.batteryLevel == 80 ||
              batteryController.batteryState == BatteryState.full) {
            batteryController.confettiController.play();
          }
        });

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BatteryIconWidget(controller: batteryController),
              32.verticalSpace,
              BatteryLevelCard(controller: batteryController),
              20.verticalSpace,
              BatteryStatusCard(controller: batteryController),
              32.verticalSpace,
              ActionButtonsWidget(controller: batteryController),
            ],
          ),
        );
      },
    );
  }
}

// Star shape for confetti
Path drawStar(Size size) {
  double degToRad(double deg) => deg * (pi / 180.0);

  const numberOfPoints = 5;
  final halfWidth = size.width / 2;
  final externalRadius = halfWidth;
  final internalRadius = halfWidth / 2;
  final degreesPerStep = degToRad(360 / numberOfPoints);
  final halfDegreesPerStep = degreesPerStep / 2;
  final path = Path();
  final fullAngle = degToRad(360);
  path.moveTo(size.width, halfWidth);

  for (double step = 0; step < fullAngle; step += degreesPerStep) {
    path.lineTo(
      halfWidth + externalRadius * cos(step),
      halfWidth + externalRadius * sin(step),
    );
    path.lineTo(
      halfWidth + internalRadius * cos(step + halfDegreesPerStep),
      halfWidth + internalRadius * sin(step + halfDegreesPerStep),
    );
  }
  path.close();
  return path;
}
