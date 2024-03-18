import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../view_model/counter_proxy_provider.dart';
import 'counter_text_widget.dart';
import 'title_text_widget.dart';

class ProxyProviderCounterOneWidget extends StatelessWidget {
  const ProxyProviderCounterOneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProxyProvider>(
      builder: (context, viewModel, child) {
        final buildTime = DateFormat('HH:mm:ss aa').format(
          DateTime.now(),
        );

        return Ink(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          child: Column(
            children: [
              const TitleTextWidget('Proxy Provider'),
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
            ],
          ),
        );
      },
    );
  }
}
