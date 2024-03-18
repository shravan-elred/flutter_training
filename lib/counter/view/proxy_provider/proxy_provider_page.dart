import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/counter_proxy_provider.dart';
import '../../view_model/counter_view_model.dart';
import 'proxy_provider_screen.dart';

class ProxyProviderPage extends StatelessWidget {
  const ProxyProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterViewModel(),
        ),
        ProxyProvider<CounterViewModel, CounterProxyProvider>(
          create: (context) => CounterProxyProvider(),
          update: (context, value, previous) =>
              value.counterOne != previous?.counterOne
                  ? CounterProxyProvider(counterOne: value.counterOne)
                  : previous ?? CounterProxyProvider(),
        ),
      ],
      child: const ProxyProviderScreen(),
    );
  }
}
