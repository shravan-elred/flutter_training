import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  const ClockPainter({
    required this.dateTime,
    this.hourHandColor = Colors.black,
    this.minuteHandColor = Colors.blue,
    this.secondHandColor = Colors.red,
    this.backgroundColor = Colors.black,
    this.borderColor = Colors.blueGrey,
  });

  final DateTime dateTime;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;
  final Color backgroundColor;
  final Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final second = dateTime.second;
    final minute = dateTime.minute;
    final hour = dateTime.hour;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final secondHandPaint = Paint()
      ..color = hourHandColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    final minuteHandPaint = Paint()
      ..color = minuteHandColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final hourHandPaint = Paint()
      ..color = hourHandColor
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final backgroundPaint = Paint()..color = backgroundColor;

    canvas.drawCircle(
      Offset(centerX, centerY),
      100,
      backgroundPaint,
    );

    canvas.drawOval(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: 100),
      borderPaint,
    );

    final secondHandX = centerX + 90 * cos(second * 6 * pi / 180);
    final secondHandY = centerY + 90 * sin(second * 6 * pi / 180);
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

    final hourHandX = centerX + 50 * cos((hour * 30 + minute * 0.5) * pi / 180);
    final hourHandY = centerY + 50 * sin((hour * 30 + minute * 0.5) * pi / 180);
    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(hourHandX, hourHandY),
      hourHandPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
