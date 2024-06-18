import 'package:flutter/material.dart';

import '../service/battery_level_service.dart';

class BatteryLevelViewModel extends ChangeNotifier {
  int batteryLevel = 0;

  final BatteryLevelService _service = BatteryLevelPlatformImpl();

  void getBatteryLevel() async {
    batteryLevel = await _service.batteryLevel() ?? 0;
    notifyListeners();
  }
}
