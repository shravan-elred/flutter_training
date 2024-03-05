import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const channelName = 'flutter_training';

class _HomeScreenState extends State<HomeScreen> {
  final channel = const MethodChannel(channelName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method channel'),
      ),
      body: Center(
        child: FilledButton.icon(
          onPressed: _showToastClickEvent,
          icon: const Icon(Icons.message),
          label: const Text('Show toast'),
        ),
      ),
    );
  }

  void _showToastClickEvent() {
    channel.invokeMapMethod('showToast');
  }
}
