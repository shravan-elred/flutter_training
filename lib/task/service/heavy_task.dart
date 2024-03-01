import 'dart:math';

class HeavyTask {
  final Random random = Random();

  int execute() {
    int number = 0;
    for (int i = 0; i < random.nextInt(9000) + 1000; i++) {
      for (int j = 0; j < random.nextInt(9000) + 1000; j++) {
        number = i * j;
      }
    }
    return number;
  }
}
