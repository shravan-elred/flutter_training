class Singleton1 {
  Singleton1._internal();
  static Singleton1? _instance;

  static Singleton1 getInstance() {
    return _instance ??= Singleton1._internal();
  }
}
