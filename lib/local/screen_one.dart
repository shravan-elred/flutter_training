import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'local_view_model.dart';
import 'screen_two.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ChangeNotifierProvider(
                create: (context) => LocalViewModel(),
                child: const ScreenTwo(),
              );
            },
          ));
        },
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
      body: Center(
        child: Text(
          'Screen One',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
