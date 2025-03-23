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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Stack(
        children: [
          Row(
            spacing: 4,
            children: [
              Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                  color: AppColors.lightBoderColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: CacheNetworkImage(
                  height: 100.w,
                  width: 90.h,
                  fit: BoxFit.contain,
                  imageUrl: favoriteModel.product.productImage!,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    favoriteModel.product.name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    favoriteModel.product.category,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.lightBlue700Color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: -8,
            child: IconButton(
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
                context.read<FavoriteCubit>().removeFromFavorite(
                  favoriteModel.id,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
