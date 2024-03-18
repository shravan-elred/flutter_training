import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two Replaced'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
      body: Center(
        child: Text(
          'Screen Two Replaced',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
