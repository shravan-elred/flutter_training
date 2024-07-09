import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../electron.dart';

class OrbitPainter extends CustomPainter {
  const OrbitPainter({
    this.strokeColor = Colors.white,
    this.strokeWidth = 1.0,
    this.electrons = const [],
  });

  final Color strokeColor;
  final double strokeWidth;

  final List<Electron> electrons;

  @override
  void paint(Canvas canvas, Size size) {
    // Paining orbit
    final orbitPaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(
      center: center,
      width: size.width,
      height: size.height,
    );
    canvas.drawOval(rect, orbitPaint);

    // Painting electron
    for (final electron in electrons) {
      final electronPaint = Paint()..color = electron.color;
      final radians = degreesToRadians(electron.degree);
      final electronPosition = center +
          Offset(
            math.cos(radians) * (size.width / 2),
            math.sin(radians) * (size.height / 2),
          );
      canvas.drawCircle(
        electronPosition,
        electron.radius,
        electronPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

double degreesToRadians(double electronDegree) {
  return electronDegree * (math.pi / 180);
}
