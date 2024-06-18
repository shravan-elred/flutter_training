import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/battery_level_view_model.dart';

class BatterLevelScreen extends StatefulWidget {
  const BatterLevelScreen({super.key});

  @override
  State<BatterLevelScreen> createState() => _BatterLevelScreenState();
}

class _BatterLevelScreenState extends State<BatterLevelScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(context.read<BatteryLevelViewModel>().getBatteryLevel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platform Channel'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Battery Level'),
            Selector<BatteryLevelViewModel, int>(
              selector: (_, vm) => vm.batteryLevel,
              builder: (context, batteryLevel, child) {
                return Text(
                  batteryLevel.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
