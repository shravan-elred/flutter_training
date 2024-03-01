import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../view_model/counter_view_model.dart';
import 'counter_text_widget.dart';
import 'decrement_button.dart';
import 'increment_button.dart';
import 'title_text_widget.dart';

class ConsumerCounterWidget extends StatelessWidget {
  const ConsumerCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterViewModel>(
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
                      child: CounterTextWidget(viewModel.counterOne),
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
                          context.read<CounterViewModel>().decrementCounterOne,
                    ),
                  ),
                  Expanded(
                    child: IncrementButton(
                      onTap:
                          context.read<CounterViewModel>().incrementCounterOne,
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
