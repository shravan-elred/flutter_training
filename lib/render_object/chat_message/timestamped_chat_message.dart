import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';

class TimestampedChatMessage extends LeafRenderObjectWidget {
  const TimestampedChatMessage({
    super.key,
    required this.text,
    required this.textStyle,
    required this.sentAt,
    required this.sentAtTextStyle,
  });

  final String text;
  final TextStyle textStyle;
  final String sentAt;
  final TextStyle sentAtTextStyle;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTimestampedChatMessage(
      text: text,
      textStyle: textStyle,
      sentAt: sentAt,
      sentAtTextStyle: sentAtTextStyle,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderTimestampedChatMessage renderObject,
  ) {
    renderObject.text = text;
    renderObject.textStyle = textStyle;
    renderObject.sentAt = sentAt;
    renderObject.sentAtTextStyle = sentAtTextStyle;
    renderObject.textDirection = Directionality.of(context);
  }
}

class RenderTimestampedChatMessage extends RenderBox {
  RenderTimestampedChatMessage({
    required String text,
    required TextStyle textStyle,
    required String sentAt,
    required TextStyle sentAtTextStyle,
    required TextDirection textDirection,
  })  : _text = text,
        _textStyle = textStyle,
        _sentAt = sentAt,
        _sentAtTextStyle = sentAtTextStyle,
        _textDirection = textDirection {
    _textPainter = TextPainter(
      text: textTextSpan,
      textDirection: textDirection,
    );
    _sentAtTextPainter = TextPainter(
      text: sentAtTextSpan,
      textDirection: textDirection,
    );
  }

  String _text;
  TextStyle _textStyle;
  String _sentAt;
  TextStyle _sentAtTextStyle;
  TextDirection _textDirection;

  late TextPainter _textPainter;
  late TextPainter _sentAtTextPainter;

  double _longestLineWidth = 0;
  double _lastMessageLineWidth = 0;
  double _lineHeight = 0;
  int _numMessageLines = 0;
  double _sentAtLineWidth = 0;
  bool _sentAtFitsOnLastLine = false;

  String get text => _text;
  set text(String value) {
    if (value == _text) return;
    _text = value;
    _textPainter.text = textTextSpan;
    markNeedsLayout();
    markNeedsSemanticsUpdate();
  }

  String get sentAt => _sentAt;
  set sentAt(String value) {
    if (value == _sentAt) return;
    _sentAt = value;
    _sentAtTextPainter.text = sentAtTextSpan;
    markNeedsLayout();
    markNeedsSemanticsUpdate();
  }

  TextSpan get textTextSpan => TextSpan(
        text: _text,
        style: _textStyle,
      );
  TextSpan get sentAtTextSpan => TextSpan(
        text: _sentAt,
        style: _sentAtTextStyle,
      );

  TextStyle get textStyle => _textStyle;
  set textStyle(TextStyle value) {
    if (value == _textStyle) return;
    _textStyle = value;
    _textPainter.text = textTextSpan;
    markNeedsLayout();
  }

  TextStyle get sentAtTextStyle => _sentAtTextStyle;
  set sentAtTextStyle(TextStyle value) {
    if (value == _sentAtTextStyle) return;
    _sentAtTextStyle = value;
    _sentAtTextPainter.text = sentAtTextSpan;
    markNeedsLayout();
  }

  TextDirection get textDirection => _textDirection;
  set textDirection(TextDirection value) {
    if (value == _textDirection) return;
    _textDirection = value;
    _textPainter.textDirection = _textDirection;
    _sentAtTextPainter.textDirection = _textDirection;
  }

  @override
  void performLayout() {
    final unconstrainedSize = _layoutText(constraints.maxWidth);
    size = constraints.constrain(unconstrainedSize);
  }

  Size _layoutText(double maxWidth) {
    if (_textPainter.text?.toPlainText() == '') return Size.zero;

    _textPainter.layout(maxWidth: maxWidth);
    final textLines = _textPainter.computeLineMetrics();

    _sentAtTextPainter.layout(maxWidth: maxWidth);
    _sentAtLineWidth = _sentAtTextPainter.computeLineMetrics().first.width;

    _longestLineWidth = 0;
    for (final line in textLines) {
      _longestLineWidth = max(_longestLineWidth, line.width);
    }
    _lastMessageLineWidth = textLines.lastOrNull?.width ?? 0;
    _lineHeight = textLines.lastOrNull?.height ?? 0;
    _numMessageLines = textLines.length;

    final sizeOfMessage = Size(_longestLineWidth, _textPainter.height);

    final lastLineWithDate = _lastMessageLineWidth + (_sentAtLineWidth * 1.1);
    if (textLines.length == 1) {
      _sentAtFitsOnLastLine = lastLineWithDate < maxWidth;
    } else {
      _sentAtFitsOnLastLine =
          lastLineWithDate < min(_longestLineWidth, maxWidth);
    }
    if (!_sentAtFitsOnLastLine) {
      return Size(
        sizeOfMessage.width,
        sizeOfMessage.height + _sentAtTextPainter.height,
      );
    } else {
      if (textLines.length == 1) {
        return Size(lastLineWithDate, sizeOfMessage.height);
      } else {
        return Size(_longestLineWidth, sizeOfMessage.height);
      }
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    _textPainter.paint(context.canvas, offset);

    late Offset sentAtOffset;
    if (_sentAtFitsOnLastLine) {
      sentAtOffset = Offset(
        offset.dx + (size.width - _sentAtLineWidth),
        offset.dy + (_lineHeight * (_numMessageLines - 1)),
      );
    } else {
      sentAtOffset = Offset(
        offset.dx + (size.width - _sentAtLineWidth),
        offset.dy + (_lineHeight * _numMessageLines),
      );
    }
    _sentAtTextPainter.paint(context.canvas, sentAtOffset);
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);

    config.isSemanticBoundary = true;
    config.label = '$text, sent $sentAt';
    config.textDirection = _textDirection;
  }
}
