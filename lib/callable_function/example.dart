import 'dart:developer';

void callableFunctionExample() {
  final a = CallableClass();
  final callableFunction = a('Shravan', 'Chilka', 23);
  log(callableFunction);
}

class CallableClass {
  String call(String firstName, String lastName, int age) =>
      'Hi, I am $firstName $lastName & I am $age years old';
}
