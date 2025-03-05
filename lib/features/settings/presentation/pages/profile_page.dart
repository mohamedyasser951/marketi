import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:marketi/features/settings/presentation/widgets/profile_body.dart';
import 'package:marketi/features/settings/presentation/widgets/profile_info_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: BlocProvider(
        create: (context) => getIt<SettingsCubit>()..getProfile(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileInfoHeader(),
              // const Divider(),
              ProfileBody(),
            ],
          ),
        ),
      ),
    );
  }
}
