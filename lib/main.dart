import 'package:flutter/material.dart';
import 'package:xno_movies/core/injection/injection.dart';
import 'package:xno_movies/navigation/router.dart';

import 'features/presentation/splash_page/splash_page.dart';

void main() async {
  Injection.initModules();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XnO Movies',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      onGenerateRoute: AppNavigator.onGeneratedRoute,
      home: const SplashPage(),
    );
  }
}
