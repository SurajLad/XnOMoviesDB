import 'package:flutter/material.dart';
import 'package:xno_movies/features/presentation/home_page/home_page.dart';
import 'package:xno_movies/navigation/routes.dart';

import '../features/presentation/movie_detail/movie_detail_page.dart';
import '../features/presentation/splash_page/splash_page.dart';

class AppNavigator {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
          settings: settings,
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
          settings: settings,
        );

      case Routes.detailsPage:
        return MaterialPageRoute(
          builder: (context) => const MovieDetailPage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
          settings: settings,
        );
    }
  }

  static dynamic getArguments(BuildContext context) =>
      ModalRoute.of(context)?.settings.arguments;
}
