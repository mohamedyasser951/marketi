import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/widgets/cache_network_image.dart';
import 'package:marketi/features/cart/data/models/add_to_cart_request_body.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketi/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:marketi/features/home/presentation/widgets/Products/products_details.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductsDetails(productModel: product);
            },
          ),
        );
      },
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Card(
                      color: AppColors.lightBlue700Color,
                      child: AspectRatio(
                        aspectRatio: 170 / 200,
                        child: CacheNetworkImage(
                          height: 170.h,
                          width: 200.w,
                          imageUrl: product.productImage!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: AddToFavoriteWidget(product: product),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("${product.price} LE", style: textTheme.bodyLarge),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        (product.averageRating).toStringAsFixed(1),
                        style: textTheme.bodyLarge,
                      ),
                      Icon(
                        Icons.star_border,
                        color: AppColors.darkBlueColor,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  product.name,
                  style: textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              AddTCartWidget(product: product),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToFavoriteWidget extends StatelessWidget {
  const AddToFavoriteWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      buildWhen:
          (previous, current) =>
              current.status.isSuccess || current.status.isFailure,
      listener: (context, state) {},
      builder: (context, state) {
        bool inFavorites = false;
        if (state.status.isSuccess && state.favorites.isNotEmpty) {
          inFavorites = state.favorites.any(
            (element) => element.product.id == product.id,
          );
        }
        return InkWell(
          onTap: () {
            if (!inFavorites) {
              context.read<FavoriteCubit>().addToFavorite(product.id);
              showToast(
                text: "${product.name} Added to your Favorites!",
                color: ToastColors.success,
              );
            } else {
              int favoriteId =
                  state.favorites
                      .firstWhere((element) => element.product.id == product.id)
                      .id;

              context.read<FavoriteCubit>().removeFromFavorite(favoriteId);
              showToast(
                text: "${product.name} Remove from your Favorites!",
                color: ToastColors.error,
              );
            }
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18,
            child: Icon(
              inFavorites ? Icons.favorite : Icons.favorite_border,
              color: AppColors.darkBlueColor,
              size: 22,
            ),
          ),
        );
      },
    );
  }
}

class AddTCartWidget extends StatelessWidget {
  final ProductModel product;
  const AddTCartWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        bool inCart = false;
        if (state.status.isSuccess && state.cartItems.isNotEmpty) {
          inCart = state.cartItems.any(
            (element) => element.product.id == product.id,
          );
        }
        return Center(
          child: ElevatedButton.icon(
            onPressed: () {
              if (!inCart) {
                context.read<CartCubit>().addToCart(
                  addToCartRequestBody: AddToCartRequestBody(
                    productId: product.id,
                    quantity: 1,
                  ),
                );

                showToast(
                  text: "${product.name} Added to your Cart!",
                  color: ToastColors.success,
                );
              } else {
                showToast(
                  text: "${product.name} Already in your Cart!",
                  color: ToastColors.error,
                );
              }
            },
            label: Text("Add To Cart"),
            icon: Icon(Icons.shopping_cart),
          ),
        );
      },
    );
  }
}
