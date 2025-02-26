import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/core/widgets/cache_network_image.dart';
import 'package:marketi/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

class FavoriteItem extends StatelessWidget {
  final ProductModel product;

  const FavoriteItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      leading: CacheNetworkImage(
        height: 50.h,
        width: 50.w,
        fit: BoxFit.contain,
        imageUrl: product.productImage!,
      ),
      title: Text(product.name),
      subtitle: Text(product.description),
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
          context.read<FavoriteCubit>().removeFromFavorite(product.id);
        },
      ),
    );
  }
}
