import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'test_screen.dart';
import 'test_view_model.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TestViewModel(),
      child: const TestScreen(),
    );
  }
}
