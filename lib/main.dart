import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/app.dart';
import 'package:marketi/core/constants/bloc_observer.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/helper/constants.dart';
import 'package:marketi/core/helper/extensions.dart';
import 'package:marketi/core/helper/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set the status bar theme to white and icon brightness to light
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,

      statusBarIconBrightness: Brightness.light, // Ensure icons are black
    ),
  );
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  /// check if user is logged in and set the isLoggedInUser variable accordingly
  checkIfLoggedInUser();

  // initialize dependency injection
  setupServiceLocator();

  // track the lifecycle of Blocs and Cubits
  Bloc.observer = MyBlocObserver();
  
  runApp(const App());
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  print(userToken);
  // onboarding
  bool? isOnboarding = await SharedPrefHelper.getBool(
    SharedPrefKeys.onboarding,
  );

  if (isOnboarding == false) {
    isCompletedOnboarding = false;
  } else {
    isCompletedOnboarding = true;
  }

  if (!userToken!.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
