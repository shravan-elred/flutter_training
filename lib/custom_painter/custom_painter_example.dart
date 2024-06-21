import 'dart:math';
import 'package:flutter/material.dart';
import 'clock_painter.dart';

class CustomPainterExample extends StatelessWidget {
  const CustomPainterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Painter'),
      ),
      body: Center(
        child: Transform.rotate(
          angle: -pi / 2,
          child: StreamBuilder<DateTime>(
            stream: Stream.periodic(
              const Duration(seconds: 1),
              (_) => DateTime.now(),
            ),
            builder: (context, snapshot) {
              return CustomPaint(
                painter: ClockPainter(
                  dateTime: snapshot.data ?? DateTime.now(),
                  hourHandColor: Theme.of(context).colorScheme.primary,
                  minuteHandColor: Theme.of(context).colorScheme.secondary,
                  secondHandColor: Theme.of(context).colorScheme.tertiary,
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.2),
                  borderColor:
                      Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
                child: const SizedBox(
                  width: 200,
                  height: 200,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
