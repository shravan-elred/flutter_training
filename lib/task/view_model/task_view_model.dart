import 'package:flutter/material.dart';

import '../service/task_isolate_service.dart';

class TaskViewModel extends ChangeNotifier {
  int result = 0;

  final TaskIsolateService isolateService = TaskIsolateService();

  void executeTaskIsolate() async {
    result = await isolateService.execute();
    notifyListeners();
  }
}
