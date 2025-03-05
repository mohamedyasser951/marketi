import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/features/Auth/presentation/pages/sign_up_page.dart';
import 'package:marketi/features/Auth/presentation/pages/login_page.dart';
import 'package:marketi/features/MainLayout/presentation/pages/main_layout.dart';
import 'package:marketi/features/home/presentation/pages/home_page.dart';
import 'package:marketi/features/onBoarding/presentation/pages/on_boarding_page.dart';
import 'package:marketi/features/splash/presentation/page/splash_page.dart';

abstract class AppRouting {
  static Route onGenerteRoute(RouteSettings settings) {
    // var args = settings.arguments;
    switch (settings.name) {
      case AppRoutePaths.splashPage:
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
        );
      case AppRoutePaths.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case AppRoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutePaths.register:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutePaths.layout:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case AppRoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
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
