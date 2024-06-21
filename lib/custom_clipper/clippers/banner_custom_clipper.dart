import 'package:flutter/material.dart';

class BannerCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final sizeX = size.width;
    final sizeY = size.height;
    final path = Path();
    path.moveTo(0, sizeY);
    path.lineTo(0.2 * sizeX, 0);
    path.lineTo(sizeX - (sizeX * 0.2), 0);
    path.lineTo(sizeX, sizeY);
    path.lineTo(0, sizeY);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
