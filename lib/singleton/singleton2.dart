class Singleton2 {
  Singleton2._internal();
  static Singleton2? _instance;

  static Singleton2 get instance {
    return _instance ??= Singleton2._internal();
  }
}
