import 'dart:math';

import 'package:flutter/material.dart';

class ArcToClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50;

    Path path = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromPoints(
            Offset(size.width - radius, 0),
            Offset(
              size.width,
              radius,
            ),
          ),
          1.5 * pi,
          0.5 * pi,
          true)
      ..lineTo(size.width, size.height - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(
                size.width - radius,
                size.height - radius,
              ),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(radius, size.height)
      ..arcTo(
          Rect.fromLTRB(
            0,
            size.height - radius,
            radius,
            size.height,
          ),
          0.5 * pi,
          0.5 * pi,
          false)
      ..lineTo(0, radius)
      ..arcTo(
        const Rect.fromLTWH(0, 0, 70, 100),
        1 * pi,
        0.5 * pi,
        false,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
