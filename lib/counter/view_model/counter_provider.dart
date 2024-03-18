import 'dart:async';

class CounterProvider {
  CounterProvider() {
    _init();
  }

  final StreamController<int> _controllerOne =
      StreamController<int>.broadcast();
  final StreamController<int> _controllerTwo =
      StreamController<int>.broadcast();

  int counterOne = 0;
  int counterTwo = 0;

  void _init() {
    // _controllerOne.add(_counterOne);
    // _controllerTwo.add(_counterTwo);
  }

  Stream<int> get counterOneStream => _controllerOne.stream;
  Stream<int> get counterTwoStream => _controllerTwo.stream;

  void incrementCounterOne() {
    _controllerOne.sink.add(counterOne++);
  }

  void incrementCounterTwo() {
    _controllerTwo.sink.add(counterTwo++);
  }

  void decrementCounterOne() {
    _controllerOne.sink.add(counterOne--);
  }

  void decrementCounterTwo() {
    _controllerTwo.sink.add(counterTwo--);
  }

  void dispose() {
    _controllerOne.close();
    _controllerTwo.close();
  }
}
