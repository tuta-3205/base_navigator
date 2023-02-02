import 'package:flutter/material.dart';

import '/src/presentation/detail_screen.dart';
import '/src/presentation/select_screen.dart';
import '/src/presentation/home_screen.dart';
import 'routes.dart';

class RouteGenerator {
  static RouteGenerator? _instance;

  RouteGenerator._();

  factory RouteGenerator() {
    _instance ??= RouteGenerator._();
    return _instance!;
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detail:
        final id = settings.arguments.toString();
        return MaterialPageRoute(builder: (_) => DetailScreen(id: id));
      case Routes.select:
        final List<String> categories = settings.arguments as List<String>;
        return MaterialPageRoute(
          builder: (_) => SelectScreen(categories: categories),
        );
      default:
        throw const RouteException('Route not found');
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
