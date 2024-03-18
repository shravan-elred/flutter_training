import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/counter_provider.dart';
import '../widgets/next_screen_button.dart';
import '../widgets/provider_counter_one_widget.dart';
import '../widgets/provider_counter_two_widget.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: ProviderCounterOneWidget(),
          ),
          const Expanded(
            child: ProviderCounterTwoWidget(),
          ),
          NextScreenButton(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Provider.value(
                    value: context.read<CounterProvider>(),
                    child: const ProviderScreen(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
