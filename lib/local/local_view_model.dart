import 'dart:developer';

import 'package:flutter/material.dart';

class LocalViewModel extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }

  @override
  void dispose() {
    log('$runtimeType disposed');
    super.dispose();
  }
}
