import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
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
        _textDirection = textDirection,
        _textPainter = TextPainter(
          text: TextSpan(text: text, style: textStyle),
          textDirection: textDirection,
        ),
        _sentAtTextPainter = TextPainter(
          text: TextSpan(text: sentAt, style: sentAtTextStyle),
          textDirection: textDirection,
        );

  String _text;
  TextStyle _textStyle;
  String _sentAt;
  TextStyle _sentAtTextStyle;
  TextDirection _textDirection;

  TextPainter _textPainter;
  TextPainter _sentAtTextPainter;

  double _longestLineWidth = 0;
  double _lastMessageLineWidth = 0;
  double _lineHeight = 0;
  double _numMessageLines = 0;

  String get text => _text;
  set text(String value) {
    if (value == _text) return;
    _text = value;
    _textPainter.text = textTextSpan;
  }

  String get sentAt => _sentAt;
  set sentAt(String value) {
    if (value == _sentAt) return;
    _sentAt = value;
    _sentAtTextPainter.text = sentAtTextSpan;
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
  }

  TextStyle get sentAtTextStyle => _sentAtTextStyle;
  set sentAtTextStyle(TextStyle value) {
    if (value == _sentAtTextStyle) return;
    _sentAtTextStyle = value;
    _sentAtTextPainter.text = sentAtTextSpan;
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
    _textPainter.layout(maxWidth: constraints.maxWidth);
    final textLines = _textPainter.computeLineMetrics();

    _longestLineWidth = 0;
    for (final line in textLines) {
      _longestLineWidth = max(_longestLineWidth, line.width);
    }
    _lastMessageLineWidth = textLines.last.width;
    _lineHeight = textLines.last.height;

    super.performLayout();
  }
}
