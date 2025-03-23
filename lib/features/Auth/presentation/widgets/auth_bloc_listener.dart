import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/helper/extensions.dart';
import 'package:marketi/core/helper/shared_pref_helper.dart';
import 'package:marketi/core/network/dio_factory.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isLoading) loading(context);
        if (state.status.isError) {
          context.pop();

          showToast(text: state.message, color: ToastColors.error);
        }
        if (state.status == AuthStatus.loggedIn) {
          context.pop();


          saveUserToken(state);
          context.pushNamedAndRemoveUntil(AppRoutePaths.layout,
              predicate: (route) => false);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void saveUserToken(AuthState state) {
    DioFactory.sendTokenAfterUserLogin(state.accessToken!);
    SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken, state.accessToken!);
    SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userRefreshToken, state.refreshToken!);
  }
}
