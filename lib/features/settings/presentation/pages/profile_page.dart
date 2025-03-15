import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/helper/extensions.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:marketi/features/settings/presentation/widgets/profile_body.dart';
import 'package:marketi/features/settings/presentation/widgets/profile_info_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status.isLoggedOut) {
            context.pushNamedAndRemoveUntil(
              AppRoutePaths.login,
              predicate: (_) => false,
            );
            showToast(text: state.message, color: ToastColors.success);
          }
          if (state.status.isError) {
            showToast(text: state.message, color: ToastColors.error);
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Profile")),
          body: BlocProvider(
            create: (context) => getIt<ProfileCubit>()..getProfile(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileInfoHeader(),
                  ProfileBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
