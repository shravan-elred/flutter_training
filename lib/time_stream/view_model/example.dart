import 'dart:math';

Stream<double> getRandomValues() async* {
  var random = Random(2);
  while (true) {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    yield random.nextDouble();
  }
}
