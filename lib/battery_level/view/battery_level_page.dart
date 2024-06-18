import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/battery_level_view_model.dart';
import 'battery_level_screen.dart';

class BatteryLevelPage extends StatelessWidget {
  const BatteryLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BatteryLevelViewModel(),
      child: const BatterLevelScreen(),
    );
  }
}
