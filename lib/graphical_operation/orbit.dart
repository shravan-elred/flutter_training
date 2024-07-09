import 'electron.dart';

class Orbit {
  const Orbit({
    required this.electrons,
    required this.angle,
  });

  final List<Electron> electrons;
  final double angle;
}
