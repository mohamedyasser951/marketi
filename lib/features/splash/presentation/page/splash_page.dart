import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';

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
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        final route = state.status.isLoggedIn
            ? AppRoutePaths.layout
            : AppRoutePaths.login;
        Future.delayed(const Duration(seconds: 2)).then(
          (_) => Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false),
        );
      },
      child: Scaffold(
        body: Center(
          child: FadeTransition(
            opacity: _animation,
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset(Assets.imagesLogoSplashScreen),
            ),
          ),
        ),
      ),
    );
  }
}

