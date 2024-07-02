import 'package:faker/faker.dart';

class Restaurant {
  const Restaurant({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
}

class AppData {
  static final faker = Faker();

  static final restaurants = List.generate(50, (index) {
    return Restaurant(
      id: index + 1,
      name: AppData.faker.food.restaurant(),
    );
  });

  static Restaurant getById(int id) {
    return restaurants.where((element) => element.id == id).first;
  }
}
