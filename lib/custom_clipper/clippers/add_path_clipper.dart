import 'package:flutter/material.dart';

class AddPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path1 = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, 0);

    Path path2 = Path()
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(0, 0);

    path1.addPath(path2, Offset(size.width / 2, 0));

    return path1;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
