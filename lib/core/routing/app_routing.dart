import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/features/login/presentation/pages/login_page.dart';
import 'package:marketi/features/onBoarding/presentation/pages/on_boarding_page.dart';

abstract class AppRouting {
  static Route onGenerteRoute(RouteSettings settings) {
    // var args = settings.arguments;
    switch (settings.name) {
      case AppRoutePaths.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case AppRoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutePaths.register:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No route defined'),
                  ),
                ));
    }
  }
}
