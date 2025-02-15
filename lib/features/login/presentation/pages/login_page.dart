import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/features/login/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20.h,
          children: [
            Image.asset(Assets.imagesLogoSplashScreen),
            LoginForm(),
          ],
        ),
      ),
    ));
  }
}
