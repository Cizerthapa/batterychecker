import 'package:batterylearn/features/home/controllers/battery_controller.dart';
import 'package:flutter/material.dart';

class BatteryLevelCard extends StatelessWidget {
  final BatteryController controller;

  const BatteryLevelCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Battery Level',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(178),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            controller.batteryLevel != null
                ? '${controller.batteryLevel}%'
                : 'Loading...',
            style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: controller.batteryLevel != null
                ? controller.batteryLevel! / 100
                : 0,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest,
            color: controller.getBatteryColor(),
            minHeight: 12,
            borderRadius: BorderRadius.circular(6),
          ),
        ],
      ),
    );
  }
}
