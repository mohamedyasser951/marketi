import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/helper/extensions.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_state.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen:
          (previous, current) =>
              current.status == ProfileStatus.update ||
              current.status == ProfileStatus.error ||
              current.status == ProfileStatus.loading,
      listener: (context, state) {
        if (state.status == ProfileStatus.update) {
          showToast(
            text: "Profile Updated Successfully",
            color: ToastColors.success,
          );
          context.pop();
        } else if (state.status == ProfileStatus.loading) {
          loading(context);
        } else if (state.status == ProfileStatus.error) {
          showToast(text: state.errorMessage!, color: ToastColors.error);
          context.pop();
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
