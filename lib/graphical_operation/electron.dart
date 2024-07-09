// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Electron {
  Electron({
    required this.degree,
    required this.speed,
    required this.radius,
    required this.color,
  });

  double degree;
  final int speed;
  final double radius;
  final Color color;
}
