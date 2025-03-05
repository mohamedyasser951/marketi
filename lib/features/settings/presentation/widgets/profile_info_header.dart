import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/core/widgets/shimmer_loading.dart';
import 'package:marketi/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:marketi/features/settings/presentation/widgets/profile_info_header_loading.dart';

class ProfileInfoHeader extends StatelessWidget {
  const ProfileInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(Assets.imagesShapes),
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            if (state.status.isError) {
              return Text(state.errorMessage!);
            } else if (state.status.isSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      state.userProfileModel!.profileImage,
                    ),
                  ),
                  Text(
                    state.userProfileModel!.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.darkBlueColor),
                  ),
                  Text(
                    state.userProfileModel!.email,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.darkBlueColor),
                  ),
                ],
              );
            }
            return Center(
                child: ShimmerLoading(widget: ProfileInfoHeaderLoading()));
          },
        ),
      ],
    );
  }
}
