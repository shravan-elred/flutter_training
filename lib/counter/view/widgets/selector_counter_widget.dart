import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'counter_text_widget.dart';
import 'decrement_button.dart';
import 'increment_button.dart';
import 'title_text_widget.dart';
import '../../view_model/counter_view_model.dart';

class SelectorCounterWidget extends StatelessWidget {
  const SelectorCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<CounterViewModel, int>(
      selector: (context, viewModel) => viewModel.counterTwo,
      builder: (context, counterTwo, child) {
        final buildTime = DateFormat('HH:mm:ss aa').format(
          DateTime.now(),
        );

        return Ink(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          child: Column(
            children: [
              const TitleTextWidget('Selector'),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: CounterTextWidget(counterTwo),
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
                      onTap:
                          context.read<CounterViewModel>().decrementCounterTwo,
                    ),
                  ),
                  Expanded(
                    child: IncrementButton(
                      onTap:
                          context.read<CounterViewModel>().incrementCounterTwo,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
