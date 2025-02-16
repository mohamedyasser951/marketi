import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/features/login/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10.h,
            children: [
              Image.asset(Assets.imagesLogInLogo),
              LoginForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Are you new in Marketi"),
                  TextButton(onPressed: () {}, child: Text("Sign Up"))
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
