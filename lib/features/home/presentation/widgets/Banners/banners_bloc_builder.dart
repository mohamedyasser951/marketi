import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/Banners/banner_builder.dart';

class BannersBlocBuilder extends StatelessWidget {
  const BannersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current.status.isGetBannerLoading ||
          current.status.isGetBannerError ||
          current.status.isGetBannerSuccess,
      builder: (context, state) {
        if (state.status.isGetBannerLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status.isGetBannerError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state.status.isGetBannerSuccess) {
          return BannerBuilder(banners: state.banners);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
