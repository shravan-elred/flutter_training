import 'package:flutter/material.dart';

import '../../../core/utils/color_extension.dart';
import '../../model/palette_model.dart';

class PaletterListItem extends StatelessWidget {
  const PaletterListItem({
    super.key,
    required this.model,
  });

  final PaletteModel model;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: HexColor.fromHex(model.color),
    );
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: HexColor.fromHex(model.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.color,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            model.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorScheme.onPrimary,
                ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              model.year.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              model.pantoneValue.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
