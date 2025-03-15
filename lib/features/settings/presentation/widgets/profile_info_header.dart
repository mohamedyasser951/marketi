import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/widgets/custome_error_widget.dart';
import 'package:marketi/core/widgets/shimmer_loading.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_state.dart';
import 'package:marketi/features/settings/presentation/widgets/profile_info_header_loading.dart';

class ProfileInfoHeader extends StatelessWidget {
  const ProfileInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(Assets.imagesShapes),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state.status.isError) {
              CustomErrorWidget(
                message: state.errorMessage.toString(),
                onRetry: () => context.read<ProfileCubit>().getProfile(),
              );
            } else if (state.status.isSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 58,
                    backgroundImage: NetworkImage(
                      state.userProfileModel!.profileImage,
                    ),
                  ),
                  Text(
                    state.userProfileModel!.name,
                    style: Theme.of(context).textTheme.headlineMedium!,
                  ),
                  Text(
                    state.userProfileModel!.email,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              );
            }
            return Center(
              child: ShimmerLoading(widget: ProfileInfoHeaderLoading()),
            );
          },
        ),
      ],
    );
  }
}
