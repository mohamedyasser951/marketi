import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custome_error_widget.dart';
import 'package:marketi/core/widgets/shimmer_loading.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/Banners/banner_builder.dart';
import 'package:marketi/features/home/presentation/widgets/Banners/banner_loading.dart';

class BannersBlocBuilder extends StatelessWidget {
  const BannersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, RequestStatus>(
      selector: (state) => state.bannersStatus,
      builder: (context, bannersStatus) {
        if (bannersStatus == RequestStatus.loading) {
          return ShimmerLoading(widget: BannerLoading());
        } 
        else if (bannersStatus == RequestStatus.error) {
          return CustomErrorWidget(
            message: context.read<HomeCubit>().state.errorMessage,
            onRetry: () => context.read<HomeCubit>().getBanners(),
          );
        } 
        else if (bannersStatus == RequestStatus.success) {
          final banners = context.read<HomeCubit>().state.banners;
          return BannerBuilder(banners: banners);
        }
        return SizedBox.shrink();
      },
    );
  }
}
