import 'package:flutter/material.dart';

class RestorableNextScreen extends StatelessWidget {
  const RestorableNextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restoratble next screen'),
      ),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
