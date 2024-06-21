import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationExample extends StatefulWidget {
  const ImplicitAnimationExample({super.key});

  @override
  State<ImplicitAnimationExample> createState() =>
      _ImplicitAnimationExampleState();
}

class _ImplicitAnimationExampleState extends State<ImplicitAnimationExample> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 2 * pi),
            duration: const Duration(milliseconds: 300),
            builder: (context, angle, child) {
              return Transform.rotate(
                angle: angle,
                child: AnimatedContainer(
                  width: isExpanded ? 200 : 100,
                  height: isExpanded ? 200 : 100,
                  decoration: BoxDecoration(
                    color: isExpanded
                        ? colorScheme.primaryContainer.withOpacity(0.6)
                        : colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(isExpanded ? 100 : 20),
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      style: (isExpanded
                              ? Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: colorScheme.onPrimaryContainer,
                                  )
                              : Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: colorScheme.onSecondaryContainer,
                                  )) ??
                          const TextStyle(),
                      duration: const Duration(milliseconds: 300),
                      child: const Text('Click Me!'),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
