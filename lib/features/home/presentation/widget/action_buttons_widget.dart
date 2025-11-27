import 'package:batterylearn/features/home/controllers/battery_controller.dart';
import 'package:flutter/material.dart';

class ActionButtonsWidget extends StatelessWidget {
  final BatteryController controller;

  const ActionButtonsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.bolt),
            label: const Text('Save Mode'),
            onPressed: () {
              _showPowerSaveDialog(context, controller);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.info),
            label: const Text('Details'),
            onPressed: () {
              _showDetailedInfoDialog(context, controller);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showPowerSaveDialog(
    BuildContext context,
    BatteryController controller,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.power_settings_new, size: 24),
            SizedBox(width: 8),
            Text('Power Save Mode'),
          ],
        ),
        content: Text(
          controller.isInBatterySaveMode != null
              ? "Power save mode is currently ${controller.isInBatterySaveMode! ? 'enabled' : 'disabled'}."
              : "Checking power save mode status...",
          style: const TextStyle(fontSize: 16, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showDetailedInfoDialog(
    BuildContext context,
    BatteryController controller,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Battery Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Battery Level', '${controller.batteryLevel}%'),
            _buildInfoRow('Status', controller.getBatteryStateText()),
            _buildInfoRow(
              'Power Save Mode',
              controller.isInBatterySaveMode != null
                  ? controller.isInBatterySaveMode!
                        ? 'Yes'
                        : 'No'
                  : 'Unknown',
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                controller.getBatteryAdvice(),
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(178),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }
}
