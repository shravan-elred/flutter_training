import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.teal.shade100,
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        height: 100,
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
