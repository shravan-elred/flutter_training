import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/task_view_model.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: context.read<TaskViewModel>().executeTaskIsolate,
        label: const Text('Execute task'),
      ),
      appBar: AppBar(
        title: const Text('Isolate'),
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, value, child) {
          return Center(
            child: Text(
              value.result.toString(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
          );
        },
      ),
    );
  }
}
