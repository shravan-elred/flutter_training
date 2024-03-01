import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/task_view_model.dart';
import 'task_screen.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: const TaskScreen(),
    );
  }
}
