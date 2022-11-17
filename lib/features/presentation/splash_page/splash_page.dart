import 'package:flutter/material.dart';
import 'package:xno_movies/core/design_system/app_colors.dart';
import 'package:xno_movies/core/design_system/text_styles.dart';
import 'package:xno_movies/navigation/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamed(
          context,
          Routes.home,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueBackground,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/splash_logo.png',
              width: 160,
            ),
            const SizedBox(height: 30),
            Text(
              'XnO Movies',
              style: AppTextStyles.primaryBodyBold
                  .copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
