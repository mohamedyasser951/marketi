import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/routing/custom_route.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:marketi/features/Auth/presentation/pages/sign_up_page.dart';
import 'package:marketi/features/Auth/presentation/pages/login_page.dart';
import 'package:marketi/features/MainLayout/presentation/cubit/main_layout_cubit.dart';
import 'package:marketi/features/MainLayout/presentation/pages/main_layout.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketi/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/pages/home_page.dart';
import 'package:marketi/features/onBoarding/presentation/pages/on_boarding_page.dart';
import 'package:marketi/features/splash/presentation/page/splash_page.dart';

abstract class AppRouting {
  static AuthCubit authCubit = getIt<AuthCubit>();
  static Route? onGenerteRoute(RouteSettings settings) {
    // var args = settings.arguments;
    switch (settings.name) {
      case AppRoutePaths.splashPage:
        return SlideLeftRoute(builder: (context) => SplashPage());
      case AppRoutePaths.onBoarding:
        return SlideLeftRoute(builder: (_) => OnBoardingScreen());
      case AppRoutePaths.login:
        return SlideLeftRoute(
          builder:
              (_) => BlocProvider.value(
                value:  authCubit,
                child: const LoginPage(),
              ),
        );
      case AppRoutePaths.register:
        return SlideLeftRoute(
          builder:
              (_) => BlocProvider.value(
                value: authCubit,
                child: const SignUpPage(),
              ),
        );
      case AppRoutePaths.layout:
        return SlideLeftRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => getIt<NavigationCubit>()),
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<HomeCubit>()
                              ..getBanners()
                              ..getCategories()
                              ..getProducts(),
                  ),

                  BlocProvider(create: (context) => getIt<CartCubit>()),
                  BlocProvider(create: (context) => getIt<FavoriteCubit>()),
                ],
                child: MainLayout(),
              ),
        );
      case AppRoutePaths.home:
        return SlideLeftRoute(builder: (_) => const HomePage());
      default:
        return null;
    }
  }
}
