import 'package:flutter/material.dart';

import '../widgets/consumer_counter_widget.dart';
import '../widgets/proxy_provider_counter_one_widget.dart';

class ProxyProviderScreen extends StatelessWidget {
  const ProxyProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proxy Provider'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ConsumerCounterWidget(),
          ),
          Expanded(
            child: ProxyProviderCounterOneWidget(),
          ),
        ],
      ),
    );
  }
}
