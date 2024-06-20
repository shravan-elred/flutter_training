import 'dart:developer';

import 'package:flutter/material.dart';

class CatelogView extends StatefulWidget {
  const CatelogView({super.key});

  @override
  State<CatelogView> createState() => _CatelogViewState();
}

class _CatelogViewState extends State<CatelogView> {
  bool excludeSemantics = false;
  bool? isTermsApproved;
  bool willAccept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catelog'),
      ),
      floatingActionButton: DragTarget<String>(
        builder: (context, candidateData, rejectedData) {
          return Container(
            width: 100,
            height: 100,
            color: Theme.of(context).colorScheme.surfaceContainer,
          );
        },
      ),
      body: Form(
        child: Column(
          children: [
            SwitchListTile(
              onChanged: (value) {
                log('$excludeSemantics = $value');
                setState(() {
                  excludeSemantics = value;
                });
              },
              value: excludeSemantics,
              title: const Text('ExcludeSemantics'),
            ),
            Semantics(
              excludeSemantics: excludeSemantics,
              hidden: excludeSemantics,
              child: const Column(
                children: [
                  Text('Hello'),
                  Text('World'),
                ],
              ),
            ),
            FormField<bool>(
              enabled: true,
              validator: (value) {
                if (value == true) return null;
                return 'Please accept terms & conditions';
              },
              autovalidateMode: AutovalidateMode.always,
              initialValue: isTermsApproved,
              builder: (field) {
                return CheckboxListTile(
                  value: field.value == true,
                  onChanged: (value) {
                    field.didChange(value);
                  },
                  isError: field.hasError,
                  title: const Text('Terms & Conditions'),
                );
              },
            ),
            LongPressDraggable<String>(
              feedback: Material(
                child: Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              childWhenDragging: Material(
                child: ListTile(
                  title: Text(
                    'John Doe',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black12),
                  ),
                ),
              ),
              child: ListTile(
                title: Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
