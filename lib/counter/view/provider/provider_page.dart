import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/counter_provider.dart';
import 'provider_screen.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CounterProvider(),
      dispose: (context, provider) => provider.dispose(),
      child: const ProviderScreen(),
    );
  }
}
