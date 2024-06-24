import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatelessWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween animation builder'),
      ),
      body: TweenAnimationBuilder(
        duration: const Duration(seconds: 60),
        tween: Tween<double>(begin: 0, end: 2 * pi),
        builder: (context, angle, child) {
          return Transform.rotate(
            angle: angle,
            child: child ?? const SizedBox.shrink(),
          );
        },
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.yellow.shade300,
                  Colors.blue,
                  Colors.indigo,
                ],
              ),
            ),
            child: Center(
              child: Text(
                'EARTH',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
