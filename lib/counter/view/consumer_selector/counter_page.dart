import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_screen.dart';

import '../../view_model/counter_view_model.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: const CounterScreen(),
    );
  }
}
