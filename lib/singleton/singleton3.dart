class Singleton3 {
  Singleton3._internal();

  factory Singleton3() {
    return _instance ??= Singleton3._internal();
  }

  static Singleton3? _instance;
}
