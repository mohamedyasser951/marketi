import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/helper/extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _startAnimation();
  }

  _startAnimation() {
    // Navigate to the next screen after the animation
    _controller.forward().whenComplete(() {
      // Navigate to the next screen after the animation is completed
      checkIsOnboardingCompletedAndCheckIsLoginOrNot();
    });
  }

  void checkIsOnboardingCompletedAndCheckIsLoginOrNot() {
    if (isCompletedOnboarding == true) {
      if (isLoggedInUser == true) {
        context.pushReplacementNamed(AppRoutePaths.layout);
      } else {
        context.pushReplacementNamed(AppRoutePaths.login);
      }
    } else {
      context.pushReplacementNamed(AppRoutePaths.onBoarding);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset(Assets.imagesLogoSplashScreen),
          ),
        ),
      ),
    );
  }
}
