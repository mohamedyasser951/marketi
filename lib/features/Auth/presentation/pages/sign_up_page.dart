import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/helper/extensions.dart';
import 'package:marketi/features/Auth/presentation/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.h),
            child: Column(
              children: [
                Image.asset(Assets.imagesLogInLogo, height: 200, width: 200),
                SignUpForm(),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        context.pushNamed(AppRoutePaths.login);
                      },
                      child: const Text("Sign In"))
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
