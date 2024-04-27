import 'package:flutter/material.dart';
import 'package:programming_course/config/router/app_router.dart';

void main() {
  runApp(MyApp(
    routes: AppRoutes(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routes});
  final AppRoutes routes;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes.router,
    );
  }
}
