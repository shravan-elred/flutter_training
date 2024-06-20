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
        child: StreamBuilder<DateTime>(
          stream: Stream.periodic(
            const Duration(seconds: 1),
            (_) => DateTime.now(),
          ),
          builder: (context, snapshot) {
            return CustomPaint(
              painter: ClockPainter(
                dateTime: snapshot.data ?? DateTime.now(),
              ),
              child: const SizedBox(
                width: 200,
                height: 200,
              ),
            );
          },
        ),
      ),
    );
  }
}
