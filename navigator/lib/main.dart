import 'package:flutter/material.dart';

import 'src/routing/routes.dart';
import 'src/routing/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigator Demo',
      initialRoute: Routes.home,
      onGenerateRoute: RouteGenerator().onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
