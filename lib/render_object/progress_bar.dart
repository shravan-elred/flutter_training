import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'render_progress_bar.dart';

class ProgressBar extends LeafRenderObjectWidget {
  const ProgressBar({
    super.key,
    required this.dotColor,
    required this.thumbColor,
    required this.thumbSize,
    this.dotSize = 4,
    this.onChanged,
    this.value = 0,
  });

  final Color dotColor;
  final Color thumbColor;
  final double thumbSize;
  final double dotSize;
  final double value;
  final void Function(double value)? onChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderProgressBar(
      dotColor: dotColor,
      thumbColor: thumbColor,
      thumbSize: thumbSize,
      dotSize: dotSize,
      onChanged: onChanged,
      value: value,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderProgressBar renderObject,
  ) {
    renderObject
      ..dotColor = dotColor
      ..thumbColor = thumbColor
      ..thumbSize = thumbSize;
    super.updateRenderObject(context, renderObject);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('dotColor', dotColor));
    properties.add(ColorProperty('thumbColor', thumbColor));
    properties.add(DoubleProperty('thumbSize', thumbSize));
    properties.add(DoubleProperty('dotSize', dotSize));
  }
}
