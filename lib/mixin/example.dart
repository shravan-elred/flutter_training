import 'dart:developer';

mixin Dance {
  void dance() => log('$runtimeType is dancing');
}

mixin Sing {
  void sing() => log('$runtimeType is singing');
}

mixin Entertain on Performer {
  void entertain() => log('$runtimeType is entertaining');
}

class Dancer with Dance {}

class Singer with Sing {}

class Performer {
  void perform() => log('$runtimeType is performing');
}

class Entertainer extends Performer with Dance, Sing, Entertain {}

class Musician extends Performer with Dance, Sing {}
