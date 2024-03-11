import 'dart:async';

import 'package:flutter/material.dart';

class TimeViewModel extends ChangeNotifier {
  TimeViewModel() {
    _controller = StreamController<DateTime>();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTime);
  }
  late final StreamController<DateTime> _controller;
  late final Timer _timer;

  Stream<DateTime> get dateTimeStream => _controller.stream;

  void _updateTime(_) {
    _controller.add(DateTime.now());
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.close();
    super.dispose();
  }
}
