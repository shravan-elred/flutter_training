import 'package:flutter/material.dart';
import 'widgets/consumer_counter_widget.dart';
import 'widgets/selector_counter_widget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ConsumerCounterWidget(),
          ),
          Expanded(
            child: SelectorCounterWidget(),
          )
        ],
      ),
    );
  }
}
