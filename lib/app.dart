import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/routing/app_routing.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<AuthCubit>()),
          BlocProvider(create: (context) => getIt<CartCubit>()..getCartItems()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          ),
          onGenerateRoute: AppRouting.onGenerteRoute,
          initialRoute: AppRoutePaths.layout,
        ),
      ),
    );
  }
}
