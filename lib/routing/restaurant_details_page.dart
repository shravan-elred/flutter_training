import 'package:flutter/material.dart';

import 'app_data.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          restaurant.name,
        ),
      ),
      body: Center(
        child: Text('$runtimeType'),
      ),
    );
  }
}
