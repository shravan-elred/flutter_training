import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveSpaceExample extends StatefulWidget {
  const RiveSpaceExample({super.key});

  @override
  State<RiveSpaceExample> createState() => _RiveSpaceExampleState();
}

class _RiveSpaceExampleState extends State<RiveSpaceExample> {
  late StateMachineController _controller;
  late SMITrigger _greenTrigger;
  late SMINumber _positionX;
  late SMINumber _positionY;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Space'),
      ),
      body: GestureDetector(
        // onPanUpdate: (details) => _onPanUpdate(details, size),
        onTap: () {
          _greenTrigger.fire();
          // _positionX.change(_positionX.value + 1);
        },
        child: Column(
          children: [
            Expanded(
              child: RiveAnimation.asset(
                onInit: _onInit,
                'assets/animations/hero_use_case.riv',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: () {
                    _positionX.change(_positionX.value - 1);
                  },
                  icon: const Icon(Icons.arrow_left),
                ),
                Column(
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        _positionY.change(_positionY.value + 1);
                      },
                      icon: const Icon(Icons.arrow_drop_up),
                    ),
                    IconButton.filled(
                      onPressed: () {
                        _positionY.change(_positionY.value - 1);
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
                IconButton.filled(
                  onPressed: () {
                    _positionX.change(_positionX.value + 1);
                  },
                  icon: const Icon(Icons.arrow_right),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _onInit(Artboard artBoard) {
    _controller = StateMachineController.fromArtboard(
      artBoard,
      'State Machine 1',
    ) as StateMachineController;
    artBoard.addController(_controller);
    _positionX = _controller.findInput<double>('numX') as SMINumber;
    _positionY = _controller.findInput<double>('numY') as SMINumber;
    _greenTrigger = _controller.findInput<bool>('Green') as SMITrigger;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details, Size size) {
    _positionX.change((details.localPosition.dx * 50) / size.width);
    _positionY.change((details.localPosition.dy * 50) / size.height);
    log('dx : ${(details.localPosition.dx * 50) / size.width}');
    // log('dy : ${details.localPosition.dy}');
  }
}
