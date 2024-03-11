import 'dart:developer';

void genericExample() {
  final List<int> numbers = <int>[1, 2, 3, 4, 5];
  log(numbers.toString());
  log(numbers.runtimeType.toString());
  final cache = CacheImpl<int>();
  cache.setValue('1', 10);
  cache.setValue('2', 20);
  log(cache.getValue('1').toString());
  log(cache.getValue('1').runtimeType.toString());
  log(cache.getValue('2').toString());
  log(cache.getValue('3').toString());
}

abstract class Cache<T extends Object> {
  T? getValue(String key);
  void setValue(String key, T value);
}

class CacheImpl<T extends Object> implements Cache<T> {
  Map<String, T> data = {};

  @override
  T? getValue(String key) {
    return data[key];
  }

  @override
  void setValue(String key, T value) {
    return data.addEntries([MapEntry(key, value)]);
  }
}
