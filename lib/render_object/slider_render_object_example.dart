import 'dart:developer';

import 'package:flutter/material.dart';

import 'progress_bar.dart';

class RenderObjectExample extends StatelessWidget {
  const RenderObjectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Render object example'),
      ),
      body: Center(
        child: Container(
          height: 16,
          width: 300,
          color: Colors.grey.shade300,
          child: ProgressBar(
            dotColor: Colors.blue,
            thumbSize: 16,
            thumbColor: Colors.red,
            onChanged: (value) {
              log('value : $value');
            },
          ),
        ),
      ),
    );
  }
}
