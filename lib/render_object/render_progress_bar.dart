import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderProgressBar extends RenderBox {
  RenderProgressBar({
    required Color dotColor,
    required Color thumbColor,
    required double thumbSize,
    required double dotSize,
    required double value,
    this.onChanged,
  })  : _dotColor = dotColor,
        _thumbColor = thumbColor,
        _thumbSize = thumbSize,
        _dotSize = dotSize,
        _currentThumbValue = value {
    _dragGestureRecognizer = HorizontalDragGestureRecognizer()
      ..onStart = (DragStartDetails details) {
        _updateThumbPosition(details.localPosition);
      }
      ..onUpdate = (DragUpdateDetails details) {
        _updateThumbPosition(details.localPosition);
      };
  }

  Color _dotColor;
  set dotColor(Color value) {
    if (_dotColor == value) return;
    _dotColor = value;
    markNeedsLayout();
  }

  Color _thumbColor;
  set thumbColor(Color value) {
    if (_thumbColor == value) return;
    _thumbColor = value;
    markNeedsLayout();
  }

  double _thumbSize;
  set thumbSize(double value) {
    if (_thumbSize == value) return;
    _thumbSize = value;
    markNeedsLayout();
  }

  double _dotSize;
  set dotSize(double value) {
    if (_dotSize == value) return;
    _dotSize = value;
    markNeedsLayout();
  }

  double _currentThumbValue = 0.5;
  final void Function(double value)? onChanged;

  late HorizontalDragGestureRecognizer _dragGestureRecognizer;

  void _updateThumbPosition(Offset localPosition) {
    // clamping the position between full width
    final dx = localPosition.dx.clamp(0, size.width);
    // make the size between 0 and 1 with only one decimal
    // e.g. 0.4 or 0.7
    final thumbValue = double.parse((dx / size.width).toStringAsFixed(1));
    if (_currentThumbValue != thumbValue) {
      _currentThumbValue = thumbValue;
      onChanged?.call(_currentThumbValue);
      markNeedsLayout();
      markNeedsSemanticsUpdate();
    }
  }

  @override
  void performLayout() {
    final desiredWidth = constraints.maxWidth;
    final desiredHeight = _thumbSize;
    final desiredSize = Size(desiredWidth, desiredHeight);
    size = constraints.constrain(desiredSize);
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(
    PointerEvent event,
    covariant BoxHitTestEntry entry,
  ) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent) {
      _dragGestureRecognizer.addPointer(event);
    }
    super.handleEvent(event, entry);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    final dotPaint = Paint()
      ..color = _dotColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _dotSize;

    final barPaint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    final thumbPaint = Paint()..color = _thumbColor;

    final thumbPositionX = _currentThumbValue * size.width;

    // paint dots
    final spacing = size.width / 10;
    for (int i = 0; i < 11; i++) {
      Offset dotUpperPoint = Offset(spacing * i, size.height * 0.75);
      Offset dotLowerPoint = Offset(spacing * i, size.height);
      if (i % 5 == 0) {
        dotUpperPoint = Offset(spacing * i, size.height * 0.25);
      }
      if (dotUpperPoint.dx <= _currentThumbValue * size.width) {
        canvas.drawLine(dotUpperPoint, dotLowerPoint, barPaint);
      } else {
        canvas.drawLine(dotUpperPoint, dotLowerPoint, dotPaint);
      }
    }

    // paint bar line
    final barLineStart = Offset(0, size.height / 2);
    final barLineEnd = Offset(thumbPositionX, size.height / 2);
    canvas.drawLine(barLineStart, barLineEnd, barPaint);

    // paint thumb
    final thumbCenter = Offset(thumbPositionX, size.height / 2);
    canvas.drawCircle(thumbCenter, _thumbSize / 2, thumbPaint);

    canvas.restore();

    super.paint(context, offset);
  }
}
