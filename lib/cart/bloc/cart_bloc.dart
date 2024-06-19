import 'dart:async';

import 'package:rxdart/subjects.dart';

class CartBloc {
  CartBloc() {
    _addItemController.stream.listen(_onAddItem);
  }

  final List<String> _cart = [];
  Stream<int> get itemCount => _itemCountSubject.stream;
  final _addItemController = StreamController<String>();

  final _itemCountSubject = BehaviorSubject<int>();

  void addItem(String item) {
    _addItemController.sink.add(item);
  }

  void clearCart() {
    _cart.clear();
    _itemCountSubject.add(0);
  }

  void _onAddItem(String item) {
    _cart.add(item);
    _itemCountSubject.add(_cart.length);
  }

  void dispose() {
    _addItemController.close();
    _itemCountSubject.close();
  }
}
