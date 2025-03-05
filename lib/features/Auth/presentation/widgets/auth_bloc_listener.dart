import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/network/dio_factory.dart';
import 'package:marketi/features/Auth/data/datasources/remote/token_manager_service.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:marketi/features/MainLayout/presentation/pages/main_layout.dart';

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
          saveUserToken(state);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainLayout()),
              (route) => false);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void saveUserToken(AuthState state) {
    DioFactory.sendTokenAfterUserLogin(state.accessToken!);

    getIt<TokenManagerService>().saveTokens(
        accessToken: state.accessToken, refreshToken: state.refreshToken!);
  }
}
