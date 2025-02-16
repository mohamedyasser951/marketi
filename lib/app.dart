import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/core/routing/app_routing.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        ),
        onGenerateRoute: AppRouting.onGenerteRoute,
        initialRoute: AppRoutePaths.onBoarding,
      ),
    );
  }
}
