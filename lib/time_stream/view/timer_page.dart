import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/time_view_model.dart';
import 'time_screen.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimeViewModel(),
      child: const TimeScreen(),
    );
  }
}
