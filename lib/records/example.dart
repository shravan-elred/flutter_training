import 'dart:developer';

void recordExpample() {
  ({int x, int y}) a = (x: 5, y: 10);
  (int x, int) b = (20, 30);
  (int x, int) c = (20, 30);

  log(a.toString());
  log(a.runtimeType.toString());
  log(a.x.toString());
  log(a.y.toString());
  log(b.toString());
  log(b.runtimeType.toString());
  log(b.$1.toString());
  log(b.$2.toString());
  log(swap(b).toString());
  log((b == c).toString());

  final map = {
    'name': 'Shravan Chilka',
    'age': 23,
  };
  log(userDetails(map).toString());
}

(int, int) swap((int, int) record) {
  return (record.$2, record.$1);
}

({String name, int age}) userDetails(Map<String, dynamic> map) {
  return (name: map['name'] as String, age: map['age'] as int);
}
