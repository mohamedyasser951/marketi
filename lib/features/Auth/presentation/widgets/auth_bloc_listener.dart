import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        }
        if (state.status == AuthStatus.loggedIn) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text("Logged In Successfully"),
            ),
          );
          // Navigator.pushNamedAndRemoveUntil(
          //     context, AppRoutePaths.home, (route) => false);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
