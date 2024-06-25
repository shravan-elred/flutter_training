import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveCircleRotateExample extends StatelessWidget {
  const RiveCircleRotateExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle rotate'),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: RiveAnimation.asset(
                'assets/animations/circle-bounce.riv',
              ),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: RiveAnimation.asset(
                'assets/animations/circle-rotate.riv',
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: RiveAnimation.asset(
                'assets/animations/circle-loader.riv',
                stateMachines: ['Green'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
