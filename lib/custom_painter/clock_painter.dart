import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  const ClockPainter({
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  void paint(Canvas canvas, Size size) {
    final second = dateTime.second;
    final minute = dateTime.minute;
    final hour = dateTime.hour;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final secondHandPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    final minuteHandPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final hourHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final secondHandX = centerX + 100 * cos(second * 6 * pi / 180);
    final secondHandY = centerY + 100 * sin(second * 6 * pi / 180);
    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(secondHandX, secondHandY),
      secondHandPaint,
    );

    final minuteHandX = centerX + 70 * cos(minute * 6 * pi / 180);
    final minuteHandY = centerY + 70 * sin(minute * 6 * pi / 180);
    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(minuteHandX, minuteHandY),
      minuteHandPaint,
    );

    final hourHandX = centerX + 50 * cos(hour * 30 + minute * 0.5 * pi / 180);
    final hourHandY = centerY + 50 * sin(hour * 30 + minute * 0.5 * pi / 180);
    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(hourHandX, hourHandY),
      hourHandPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
