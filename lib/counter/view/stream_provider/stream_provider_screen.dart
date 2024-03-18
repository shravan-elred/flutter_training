import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/counter_text_widget.dart';
import '../widgets/title_text_widget.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Consumer<int>(
        builder: (context, value, child) {
          final buildTime = DateFormat('HH:mm:ss aa').format(
            DateTime.now(),
          );
          return Ink(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Column(
              children: [
                const TitleTextWidget('Stream Provider'),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: CounterTextWidget(value),
                      ),
                      Text(
                        'Built at $buildTime',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
