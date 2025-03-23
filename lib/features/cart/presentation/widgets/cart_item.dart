import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/core/widgets/cache_network_image.dart';
import 'package:marketi/features/cart/data/models/add_to_cart_request_body.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';

class CartTile extends StatelessWidget {
  final CartItemModel item;

  const CartTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
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
                  imageUrl: item.product.productImage!,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.product.category,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${item.product.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CartCubit>().removeFromCart(cartId: item.cartId);
                },
                icon: const Icon(Icons.delete, color: Colors.red, size: 20),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.lightBoderColor.withValues(alpha: 0.2),

                  border: Border.all(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (item.quantity == 1) return;
                        context.read<CartCubit>().updateCart(
                          cartId: item.cartId,
                          addToCartRequestBody: AddToCartRequestBody(
                            quantity: item.quantity - 1,
                            productId: item.product.id,
                          ),
                        );
                      },
                      iconSize: 18,
                      icon: const Icon(Icons.remove_outlined),
                    ),
                    Text(
                      item.quantity.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().updateCart(
                          cartId: item.cartId,
                          addToCartRequestBody: AddToCartRequestBody(
                            quantity: item.quantity + 1,
                            productId: item.product.id,
                          ),
                        );
                      },
                      iconSize: 18,
                      icon: const Icon(Icons.add_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
