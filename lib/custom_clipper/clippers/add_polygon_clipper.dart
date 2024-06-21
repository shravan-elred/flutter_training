import 'package:flutter/material.dart';

class AddPolygonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var points = [
      Offset(size.width / 2, 0),
      Offset(0, size.height / 2),
      Offset(size.width / 2, size.height),
      Offset(size.width, size.height / 2)
    ];

    Path path = Path()
      ..addPolygon(points, false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
