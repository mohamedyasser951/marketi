import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/routing/app_routing.dart';
import 'package:marketi/core/theme/app_theme.dart';
import 'package:marketi/core/theme/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDarkTheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
              onGenerateRoute: AppRouting.onGenerteRoute,
              initialRoute: AppRoutePaths.splashPage,
            );
          },
        ),
      ),
    );
  }
}
