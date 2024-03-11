import 'package:flutter/material.dart';

import 'extension/example.dart';
import 'screen_two.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen one'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.arrow_forward_ios_sharp),
        onPressed: () => context.push(const ScreenTwo()),
        label: const Text('Screen two'),
      ),
      body: Center(
        child: Text(
          'Screen one',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
