import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextFileld(
                controller: _emailController,
                validator: (value) {
                  return null;
                },
                textInputType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                hint: "Email",
              ),
              AppTextFileld(
                  controller: _passwordController,
                  hint: "Password",
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                  suffixWidget:
                      IconButton(onPressed: null, icon: Icon(Icons.visibility)),
                  validator: (value) {
                    return null;
                  }),
              AppButton(btnText: "Login", onPress: () {})
            ]));
  }
}
