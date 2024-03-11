import 'package:flutter/material.dart';

extension IterableExtensions<T> on Iterable<T> {
  T? get firstOrNull {
    var iterator = this.iterator;
    if (iterator.moveNext()) return iterator.current;
    return null;
  }

  T operator [](int index) {
    return elementAt(index);
  }
}

extension StringExtensions on String {
  String capitalizeFirst() {
    if (isNotEmpty) return this[0].toUpperCase() + substring(1);
    return this;
  }

  String titleCase() {
    if (isNotEmpty) {
      return trim().split(' ').map((str) => str.capitalizeFirst()).join(' ');
    }

    return this;
  }
}

extension NavigationExtensions on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pop() {
    return Navigator.of(this).pop();
  }
}
