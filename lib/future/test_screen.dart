import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'test_view_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    log('initState');
    Future.microtask(() {
      context.read<TestViewModel>().updateName();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log('didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Microtask'),
      ),
      body: Consumer<TestViewModel>(
        builder: (context, value, child) {
          return Center(
            child: Text(
              value.name,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          );
        },
      ),
    );
  }
}
