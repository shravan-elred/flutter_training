import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'electron.dart';
import 'orbit.dart';
import 'painters/orbit_painter.dart';

class ElectronCounterScreen extends StatefulWidget {
  const ElectronCounterScreen({super.key});

  @override
  State<ElectronCounterScreen> createState() => _ElectronCounterScreenState();
}

class _ElectronCounterScreenState extends State<ElectronCounterScreen>
    with SingleTickerProviderStateMixin {
  late Timer timer;
  double electronDegree = 0.0;

  List<Orbit> orbits = [
    Orbit(electrons: List.empty(growable: true), angle: 0),
    Orbit(electrons: List.empty(growable: true), angle: 60),
    Orbit(electrons: List.empty(growable: true), angle: 120),
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(milliseconds: 16),
      (timer) {
        for (final orbit in orbits) {
          for (final electron in orbit.electrons) {
            setState(() {
              electron.degree += electron.speed;
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electron counter screen'),
        actions: [
          IconButton(
            onPressed: onResetAllEvent,
            icon: const Icon(Icons.restart_alt),
          ),
          const SizedBox(width: 16),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onAddElectronEvent,
        icon: const Icon(Icons.add),
        label: const Text('Add electron'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ...orbits.map(
              (orbit) => Transform.rotate(
                angle: degreesToRadians(orbit.angle),
                child: CustomPaint(
                  painter: OrbitPainter(
                    electrons: orbit.electrons,
                    strokeColor: Colors.white30,
                  ),
                  size: const Size(300, 80),
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.white24,
                    spreadRadius: 5,
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.deepOrangeAccent,
                    Colors.orangeAccent,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onAddElectronEvent() {
    final randomOrbit = orbits[math.Random().nextInt(orbits.length)];
    randomOrbit.electrons.add(
      Electron(
        degree: 0,
        speed: math.Random().nextInt(4) + 1,
        radius: math.Random().nextDouble() * 8,
        color: Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
      ),
    );
  }

  void onResetAllEvent() {
    for (final orbit in orbits) {
      orbit.electrons.clear();
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
