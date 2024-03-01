import 'package:flutter/material.dart';

class CounterTextWidget extends StatelessWidget {
  const CounterTextWidget(
    this.counter, {
    super.key,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        counter.toString(),
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
