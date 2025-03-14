import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/widgets/custome_error_widget.dart';
import 'package:marketi/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:marketi/features/favorite/presentation/widgets/favorite_builder.dart';

class FavoriteBlocBuilder extends StatelessWidget {
  const FavoriteBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      buildWhen:
          (previous, current) =>
              current.status.isSuccess || current.status.isFailure,
      builder: (context, state) {
        if (state.status.isFailure) {
          return CustomErrorWidget(
            message: context.read<FavoriteCubit>().state.errorMessage,
            onRetry: () => context.read<FavoriteCubit>().getFavorite(),
          );
        } else if (state.status.isSuccess) {
          if (state.favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 25.h,
                children: [
                  SvgPicture.asset(Assets.imagesCartEmpty),
                  Text(
                    "Your Favorite is Empty",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "Check our big offers, fresh products\n and fill your Favorites with items",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
          return FavoriteBuilder(favorite: state.favorites);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
