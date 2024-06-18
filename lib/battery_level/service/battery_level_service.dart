import 'dart:developer';

import 'package:flutter/services.dart';

const platform = MethodChannel('com.flutter_training.dev/battery');

abstract class BatteryLevelService {
  Future<int?> batteryLevel();
}

class BatteryLevelPlatformImpl extends BatteryLevelService {
  @override
  Future<int?> batteryLevel() async {
    try {
      return await platform.invokeMethod<int>('getBatteryLevel');
    } catch (e, s) {
      log('batteryLevel', error: e, stackTrace: s);
      return null;
    }
  }
}
