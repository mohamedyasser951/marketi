import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/core/widgets/cache_network_image.dart';
import 'package:marketi/features/favorite/data/models/favorite_model.dart';
import 'package:marketi/features/favorite/presentation/cubit/favorite_cubit.dart';

class FavoriteItem extends StatelessWidget {
  final FavoriteModel favoriteModel;

  const FavoriteItem({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightBoderColor.withValues(alpha: 0.3),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: CacheNetworkImage(
          height: 70.h,
          width: 60.w,
          fit: BoxFit.contain,
          imageUrl: favoriteModel.product.productImage!,
        ),
        title: Text(favoriteModel.product.name),
        subtitle: Text(
          favoriteModel.product.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18,
            child: Icon(
              Icons.favorite,
              color: AppColors.darkBlueColor,
              size: 22,
            ),
          ),
          onPressed: () {
            context.read<FavoriteCubit>().removeFromFavorite(favoriteModel.id);
          },
        ),
      ),
    );
  }
}
