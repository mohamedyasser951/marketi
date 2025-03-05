import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/utils/common.dart';
import 'package:marketi/features/Auth/data/datasources/local/auth_local_data_source.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:marketi/features/Auth/presentation/pages/login_page.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      children: [
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(Assets.imagesPerson),
          title: const Text("Account Preferences"),
          trailing: const Icon(CupertinoIcons.right_chevron),
        ),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(Assets.imagesCredit),
          title: const Text("Subscription & Payment"),
          trailing: const Icon(CupertinoIcons.right_chevron),
        ),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(Assets.imagesNotification),
          title: const Text("App Notifications"),
          trailing: Switch.adaptive(value: true, onChanged: (value) {}),
        ),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(Assets.imagesDarkMode),
          title: const Text("Dark Mode"),
          trailing: Switch.adaptive(value: false, onChanged: (value) {}),
        ),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(Assets.imagesRate),
          title: const Text("Rate Us"),
          trailing: const Icon(CupertinoIcons.right_chevron),
        ),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(Assets.imagesFeedback),
          title: const Text("Provide Feedback"),
          trailing: const Icon(CupertinoIcons.right_chevron),
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status.isError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state.status == AuthStatus.loggedOut) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Logged Out Successfully")));
              getIt.get<AuthLocalDataSource>().deleteTokens();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            }
          },
          child: ListTile(
            onTap: () {
              Commons.showLogoutDialog(context);
            },
            leading: SvgPicture.asset(Assets.imagesLogOut),
            title: const Text("Log Out"),
            trailing: const Icon(CupertinoIcons.right_chevron),
          ),
        ),
      ],
    );
  }
}
