import 'package:flutter/material.dart';

class RenderObjectDemoScreen extends StatefulWidget {
  const RenderObjectDemoScreen({super.key});

  @override
  State<RenderObjectDemoScreen> createState() => _RenderObjectDemoScreenState();
}

class _RenderObjectDemoScreenState extends State<RenderObjectDemoScreen> {
  bool value = true;

  final first = const Text('Hi');
  final second = const Text('Bye');
  final third = Container(
    color: Colors.red,
    width: 100,
    height: 100,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Render Object Demo'),
      ),
      body: Column(
        children: [
          value ? first : second,
          FilledButton(
            onPressed: () {
              setState(() {
                value = !value;
              });
            },
            child: const Text('Chnage Widget'),
          )
        ],
      ),
    );
  }
}
