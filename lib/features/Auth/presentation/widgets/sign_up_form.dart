import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';
import 'package:marketi/features/Auth/data/models/signup_request_body.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:marketi/features/Auth/presentation/widgets/auth_bloc_listener.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late GlobalKey<FormState> _formKey;

  late ValueNotifier<bool> valueNotifierPassword;
  late ValueNotifier<bool> valueNotifierConfirmPassword;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    valueNotifierPassword = ValueNotifier<bool>(true);
    valueNotifierConfirmPassword = ValueNotifier<bool>(true);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    valueNotifierPassword.dispose();
    valueNotifierConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthBlocListener(),
              AppTextFileld(
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
                textInputType: TextInputType.name,
                prefixIcon: Icons.person,
                hint: "Name",
              ),
              AppTextFileld(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
                textInputType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                hint: "Email",
              ),
              ValueListenableBuilder<bool>(
                  valueListenable: valueNotifierPassword,
                  builder: (context, value, child) {
                    return AppTextFileld(
                        controller: _passwordController,
                        prefixIcon: Icons.lock_clock_outlined,
                        hint: "Password",
                        obscureText: value,
                        textInputType: TextInputType.visiblePassword,
                        suffixWidget: IconButton(
                            onPressed: () {
                              valueNotifierPassword.value =
                                  !valueNotifierPassword.value;
                            },
                            icon: Icon(
                              valueNotifierPassword.value
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
              ValueListenableBuilder<bool>(
                  valueListenable: valueNotifierConfirmPassword,
                  builder: (context, value, child) {
                    return AppTextFileld(
                        controller: _confirmPasswordController,
                        prefixIcon: Icons.lock_clock_outlined,
                        hint: "Confirm Password",
                        obscureText: value,
                        textInputType: TextInputType.visiblePassword,
                        suffixWidget: IconButton(
                            onPressed: () {
                              valueNotifierConfirmPassword.value =
                                  !valueNotifierConfirmPassword.value;
                            },
                            icon: Icon(
                              valueNotifierConfirmPassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm Password is required";
                          }
                          return null;
                        });
                  }),
              SizedBox(height: 20.h),
              AppButton(
                  btnText: "Sign Up",
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().signup(SignupRequestBody(
                          email: _emailController.text,
                          name: _nameController.text,
                          confirmPassword: _confirmPasswordController.text,
                          password: _passwordController.text));
                    }
                  })
            ]));
  }
}
