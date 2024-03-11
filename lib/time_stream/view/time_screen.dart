import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../view_model/time_view_model.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Center(
        child: StreamBuilder<DateTime>(
          stream: context.read<TimeViewModel>().dateTimeStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('hh : mm').format(snapshot.requireData),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(height: 0.75),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    DateFormat('ss aa').format(snapshot.requireData),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                          height: 1,
                        ),
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
