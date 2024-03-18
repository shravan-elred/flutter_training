import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../counter/view/widgets/counter_text_widget.dart';
import '../counter/view/widgets/decrement_button.dart';
import '../counter/view/widgets/increment_button.dart';
import '../counter/view/widgets/next_screen_button.dart';
import '../counter/view/widgets/title_text_widget.dart';
import 'local_view_model.dart';
import 'screen_three.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: Consumer<LocalViewModel>(
        builder: (context, viewModel, child) {
          final buildTime = DateFormat('HH:mm:ss aa').format(
            DateTime.now(),
          );

          return Ink(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Column(
              children: [
                const TitleTextWidget('Consumer'),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: CounterTextWidget(viewModel.counter),
                      ),
                      Text(
                        'Built at $buildTime',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DecrementButton(
                        onTap: viewModel.decrementCounter,
                      ),
                    ),
                    Expanded(
                      child: IncrementButton(
                        onTap: viewModel.incrementCounter,
                      ),
                    ),
                  ],
                ),
                NextScreenButton(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) {
                          return ChangeNotifierProvider.value(
                            value: context.read<LocalViewModel>(),
                            child: const ScreenTwo(),
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
