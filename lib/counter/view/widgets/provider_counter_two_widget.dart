import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../view_model/counter_provider.dart';
import 'counter_text_widget.dart';
import 'decrement_button.dart';
import 'increment_button.dart';
import 'title_text_widget.dart';

class ProviderCounterTwoWidget extends StatelessWidget {
  const ProviderCounterTwoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: context.read<CounterProvider>().counterTwoStream,
      builder: (context, snapshot) {
        final buildTime = DateFormat('HH:mm:ss aa').format(
          DateTime.now(),
        );
        return Ink(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Column(
            children: [
              const TitleTextWidget('Provider Stream'),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: CounterTextWidget(snapshot.data ?? 0),
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
                          context.read<CounterProvider>().decrementCounterTwo,
                    ),
                  ),
                  Expanded(
                    child: IncrementButton(
                      onTap:
                          context.read<CounterProvider>().incrementCounterTwo,
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
