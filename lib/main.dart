import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:programming_course/config/router/app_router.dart';
import 'package:programming_course/firebase_options.dart';

import 'config/provider/bloc_global_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(
    fileName: 'asset/.env',
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = MyGlobalObserver();
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
