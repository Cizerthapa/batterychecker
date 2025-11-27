import 'package:batterylearn/features/home/controllers/battery_controller.dart';
import 'package:flutter/material.dart';

class BatteryStatusCard extends StatelessWidget {
  final BatteryController controller;

  const BatteryStatusCard({super.key, required this.controller});

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
          _buildStatusRow(context, 'Status', controller.getBatteryStateText()),
          const SizedBox(height: 12),
          _buildStatusRow(
            context,
            'Power Save Mode',
            controller.isInBatterySaveMode != null
                ? controller.isInBatterySaveMode!
                      ? 'Enabled'
                      : 'Disabled'
                : 'Loading...',
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(178),
          ),
        ),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
