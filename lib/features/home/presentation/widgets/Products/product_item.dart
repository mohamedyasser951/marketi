import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/cart/data/models/add_to_cart_request_body.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
        color: Colors.white,
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
                          child: CachedNetworkImage(
                            height: 170,
                            width: 200,
                            fit: BoxFit.contain,
                            imageUrl: product.productImage!,
                          ),
                        )),
                    Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.darkBlueColor,
                            size: 22,
                          ),
                        ))
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
              )),
              AddTCartWidget(
                product: product,
              )
            ],
          ),
        ));
  }
}

class AddTCartWidget extends StatelessWidget {
  final ProductModel product;
  const AddTCartWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        bool inCart = false;
        if (state.status.isSuccess && state.cartItems.isNotEmpty) {
          inCart = state.cartItems
              .any((element) => element.product.id == product.id);
        }
        return Center(
          child: ElevatedButton.icon(
            onPressed: () {
              if (!inCart) {
                context.read<CartCubit>().addToCart(
                    addToCartRequestBody: AddToCartRequestBody(
                        productId: product.id, quantity: 1));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: Colors.green,
                      showCloseIcon: true,
                      content: Text('${product.name} added to your cart!')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: Colors.redAccent,
                      showCloseIcon: true,
                      content:
                          Text('${product.name} is already in your cart!')),
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
