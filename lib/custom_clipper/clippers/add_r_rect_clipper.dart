import 'package:flutter/material.dart';

class AddRRectClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10;

    Path path = Path()
      ..addRRect(
        RRect.fromLTRBR(0, 0, 60, 60, Radius.circular(radius)),
      )
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, size.height - 50, 50, 50),
          Radius.circular(radius),
        ),
      )
      ..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: 30,
          ),
          topLeft: Radius.circular(radius),
        ),
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
