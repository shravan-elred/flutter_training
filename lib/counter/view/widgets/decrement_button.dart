import 'package:flutter/material.dart';

class DecrementButton extends StatelessWidget {
  const DecrementButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 100,
        child: const Center(
          child: Icon(Icons.remove),
        ),
      ),
    );
  }
}
