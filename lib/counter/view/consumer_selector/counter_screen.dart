import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/counter_view_model.dart';
import '../widgets/consumer_counter_widget.dart';
import '../widgets/next_screen_button.dart';
import '../widgets/selector_counter_widget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: ConsumerCounterWidget(),
          ),
          const Expanded(
            child: SelectorCounterWidget(),
          ),
          NextScreenButton(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider.value(
                    value: context.read<CounterViewModel>(),
                    child: const CounterScreen(),
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
