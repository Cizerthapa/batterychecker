import 'package:batterylearn/features/home/controllers/battery_controller.dart';
import 'package:flutter/material.dart';

class BatteryIconWidget extends StatelessWidget {
  final BatteryController controller;

  const BatteryIconWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: controller.getBatteryColor().withAlpha(77),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(
        controller.getBatteryIcon(),
        size: 80,
        color: controller.getBatteryColor(),
      ),
    );
  }
}
