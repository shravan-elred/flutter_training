import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int _counterOne = 0;
  int get counterOne => _counterOne;

  int _counterTwo = 0;
  int get counterTwo => _counterTwo;

  void incrementCounterOne() {
    _counterOne++;
    notifyListeners();
  }

  void incrementCounterTwo() {
    _counterTwo++;
    notifyListeners();
  }

  void decrementCounterOne() {
    _counterOne--;
    notifyListeners();
  }

  void decrementCounterTwo() {
    _counterTwo--;
    notifyListeners();
  }
}
