import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_state.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen:
          (previous, current) =>
              current.updateProfileStatus == ProfileStatus.loading ||
              current.updateProfileStatus == ProfileStatus.error ||
              current.updateProfileStatus == ProfileStatus.success,
      listener: (context, state) {
        if (state.updateProfileStatus.isSuccess) {
          showToast(
            text: "Profile Updated Successfully",
            color: ToastColors.success,
          );
          
        } else if (state.updateProfileStatus.isLoading) {
          loading(context);
        } else if (state.updateProfileStatus.isError) {
          showToast(text: state.errorMessage!, color: ToastColors.error);
          
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
