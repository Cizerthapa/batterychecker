import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class BatteryController with ChangeNotifier {
  final Battery _battery = Battery();
  final ConfettiController confettiController = ConfettiController(
    duration: const Duration(seconds: 3),
  );
  BatteryState? _batteryState;
  int? _batteryLevel;
  bool? _isInBatterySaveMode;

  StreamSubscription<BatteryState>? _batteryStateSubscription;
  StreamSubscription<int>? _batteryLevelSubscription;

  BatteryState? get batteryState => _batteryState;
  int? get batteryLevel => _batteryLevel;
  bool? get isInBatterySaveMode => _isInBatterySaveMode;

  Future<void> initializeBatteryData() async {
    _updateBatteryState(await _battery.batteryState);
    _updateBatteryLevel(await _battery.batteryLevel);
    _updateBatterySaveMode(await _battery.isInBatterySaveMode);

    _batteryStateSubscription = _battery.onBatteryStateChanged.listen(
      _updateBatteryState,
    );
  }

  void _updateBatteryState(BatteryState state) {
    if (_batteryState == state) return;
    _batteryState = state;
    notifyListeners();
  }

  void _updateBatteryLevel(int level) {
    if (_batteryLevel == level) return;
    _batteryLevel = level;
    notifyListeners();
  }

  void _updateBatterySaveMode(bool isInPowerSaveMode) {
    if (_isInBatterySaveMode == isInPowerSaveMode) return;
    _isInBatterySaveMode = isInPowerSaveMode;
    notifyListeners();
  }

  Future<void> refreshBatteryData() async {
    final batteryLevel = await _battery.batteryLevel;
    final batteryState = await _battery.batteryState;
    final powerSaveMode = await _battery.isInBatterySaveMode;

    _batteryLevel = batteryLevel;
    _batteryState = batteryState;
    _isInBatterySaveMode = powerSaveMode;
    notifyListeners();
  }

  Color getBatteryColor() {
    if (_batteryLevel == null) return Colors.grey;
    if (_batteryLevel! <= 15) return Colors.red;
    if (_batteryLevel! <= 30) return Colors.orange;
    if (_batteryLevel! <= 60) return Colors.yellow;
    return Colors.green;
  }

  IconData getBatteryIcon() {
    switch (_batteryState) {
      case BatteryState.charging:
        return Icons.battery_charging_full;
      case BatteryState.full:
        return Icons.battery_full;
      case BatteryState.discharging:
        if (_batteryLevel == null) return Icons.battery_unknown;
        if (_batteryLevel! <= 15) return Icons.battery_alert;
        if (_batteryLevel! <= 30) return Icons.battery_1_bar;
        if (_batteryLevel! <= 50) return Icons.battery_2_bar;
        if (_batteryLevel! <= 80) return Icons.battery_4_bar;
        return Icons.battery_full;
      default:
        return Icons.battery_unknown;
    }
  }

  String getBatteryStateText() {
    switch (_batteryState) {
      case BatteryState.charging:
        return 'Charging';
      case BatteryState.discharging:
        return 'Discharging';
      case BatteryState.full:
        return 'Full';
      case BatteryState.unknown:
      default:
        return 'Unknown';
    }
  }

  String getBatteryAdvice() {
    if (_batteryLevel == null) return '';
    if (_batteryLevel! <= 15) {
      return '⚡ Battery critically low! Connect to charger immediately.';
    }
    if (_batteryLevel! <= 30) {
      return '🔋 Battery getting low. Consider charging soon.';
    }
    if (_batteryState == BatteryState.charging && _batteryLevel! >= 90) {
      return '💡 Battery almost full. You can unplug to save energy.';
    }
    if (_isInBatterySaveMode == true) {
      return '🌱 Power save mode active. Some features may be limited.';
    }
    return '✅ Battery status is good.';
  }

  @override
  void dispose() {
    _batteryStateSubscription?.cancel();
    _batteryLevelSubscription?.cancel();
    confettiController.dispose();
    super.dispose();
  }
}
