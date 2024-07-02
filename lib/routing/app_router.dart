import 'dart:developer';

import 'package:go_router/go_router.dart';

import 'app_data.dart';
import 'restaurant_details_page.dart';
import 'restaurants_page.dart';
import 'login_page.dart';

bool isAuthenticated = true;

class AppRouter {
  const AppRouter._();
  static final instance = GoRouter(
    redirect: (context, state) {
      if (isAuthenticated) return state.path;
      return '/login';
    },
    initialLocation: '/restaurants/1',
    routes: [
      GoRoute(
        path: '/restaurants',
        name: 'restaurants',
        builder: (context, state) => const RestaurantsPage(),
      ),
      GoRoute(
        path: '/restaurants/:id',
        name: 'restaurant-details',
        builder: (context, state) {
          log(state.pathParameters.toString());
          return RestaurantDetailsPage(
            restaurant: AppData.getById(
                int.parse(state.pathParameters['id'] as String)),
          );
        },
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
