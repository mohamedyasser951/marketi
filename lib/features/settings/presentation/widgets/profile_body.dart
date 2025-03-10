import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/utils/common.dart';


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
        ListTile(
          onTap: () {
            Commons.showLogoutDialog(context);
          },
          leading: SvgPicture.asset(Assets.imagesLogOut),
          title: const Text("Log Out"),
          trailing: const Icon(CupertinoIcons.right_chevron),
        ),
      ],
    );
  }
}
