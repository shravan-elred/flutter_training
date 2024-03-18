import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stream_provider_screen.dart';

class StreamProviderPage extends StatelessWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>(
      create: (context) => Stream.periodic(
        const Duration(seconds: 10),
      ),
      initialData: 0,
      child: const StreamProviderScreen(),
    );
  }
}
