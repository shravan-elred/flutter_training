import 'package:flutter/foundation.dart';

import 'heavy_task.dart';

class TaskIsolateService {
  Future<int> execute() {
    return compute<HeavyTask, int>(
      (task) => task.execute(),
      HeavyTask(),
    );
  }
}
