import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'app_data.dart';
import 'app_router.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
      ),
      body: ListView.separated(
        itemCount: AppData.restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = AppData.restaurants[index];
          return ListTile(
            onTap: () {
              AppRouter.instance.push('/restaurants/${restaurant.id}');
            },
            title: Text(restaurant.name),
            leading: CircleAvatar(
              child: Text(restaurant.id.toString()),
            ),
          );
        },
        separatorBuilder: (_, __) => const Divider(
          thickness: 0.1,
          height: 1,
        ),
      ),
    );
  }
}
