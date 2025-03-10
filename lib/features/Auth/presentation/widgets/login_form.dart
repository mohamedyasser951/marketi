import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:marketi/features/Auth/presentation/widgets/auth_bloc_listener.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  late ValueNotifier<bool> valueNotifier;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    valueNotifier = ValueNotifier<bool>(true);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            // spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthBlocListener(),
              AppTextFileld(
                controller: _emailController,
                validator: (value) {
                  return null;
                },
                textInputType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                hint: "Email",
              ),
              SizedBox(height: 20.h),
              ValueListenableBuilder<bool>(
                  valueListenable: valueNotifier,
                  builder: (context, value, child) {
                    return AppTextFileld(
                        controller: _passwordController,
                        prefixIcon: Icons.lock_clock_outlined,
                        hint: "Password",
                        obscureText: value,
                        textInputType: TextInputType.visiblePassword,
                        suffixWidget: IconButton(
                            onPressed: () {
                              valueNotifier.value = !valueNotifier.value;
                            },
                            icon: Icon(
                              valueNotifier.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          }
                          return null;
                        });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text("Remember me"),
                  ]),
                  TextButton(onPressed: () {}, child: Text("Forget Password?"))
                ],
              ),
              SizedBox(height: 20.h),
              AppButton(
                  btnText: "Login",
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().login(
                          email: _emailController.text,
                          password: _passwordController.text);
                    }
                  })
            ]));
  }
}
