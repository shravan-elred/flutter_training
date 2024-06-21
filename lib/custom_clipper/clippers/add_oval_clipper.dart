import 'package:flutter/material.dart';

class AddOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..addOval(
        Rect.fromPoints(
          const Offset(0, 0),
          const Offset(60, 60),
        ),
      )
      ..addOval(
        Rect.fromLTWH(0, size.height - 50, 100, 50),
      )
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: 20,
        ),
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
