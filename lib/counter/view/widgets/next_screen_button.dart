import 'package:flutter/material.dart';

class NextScreenButton extends StatelessWidget {
  const NextScreenButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        height: 60,
        child: const Center(
          child: Text('Navigate to next screen'),
        ),
      ),
    );
  }
}
