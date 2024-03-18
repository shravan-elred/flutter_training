import 'dart:developer';

import 'package:flutter/material.dart';

class TestViewModel extends ChangeNotifier {
  String name = 'Shravan';

  void updateName() async {
    log('updateName');
    Future.delayed(
      const Duration(seconds: 10),
      () {
        name = 'Shravan Chilka';
        notifyListeners();
      },
    );
  }
}
