import 'package:flutter/material.dart';

import 'extension/example.dart';
import 'time_stream/view/timer_page.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen two'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
        onPressed: () => context.pop(),
        label: const Text('Screen one'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Screen two',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            FilledButton.tonal(
              onPressed: () => context.push(const TimerPage()),
              child: const Text('Timer'),
            )
          ],
        ),
      ),
    );
  }
}
