import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/cache_network_image.dart';
import 'package:marketi/features/cart/data/models/add_to_cart_request_body.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItemModel;
  const CartItem({
    super.key,
    required this.cartItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.pink.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CacheNetworkImage(
                    height: 100.w,
                    width: 90.h,
                    imageUrl: cartItemModel.product.productImage!),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.h,
                  children: [
                    Text(cartItemModel.product.name),
                    Text(cartItemModel.product.category),
                    Text(" ${cartItemModel.product.price}\$"),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 2,
            top: 10,
            child: Column(
              spacing: 0,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    context
                        .read<CartCubit>()
                        .removeFromCart(cartId: cartItemModel.cartId);
                  },
                ),
                Row(children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<CartCubit>().updateCart(
                          cartId: cartItemModel.cartId,
                          addToCartRequestBody: AddToCartRequestBody(
                              quantity: cartItemModel.quantity - 1,
                              productId: cartItemModel.product.id));
                    },
                  ),
                  Text(
                    cartItemModel.quantity.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<CartCubit>().updateCart(
                          cartId: cartItemModel.cartId,
                          addToCartRequestBody: AddToCartRequestBody(
                              quantity: cartItemModel.quantity + 1,
                              productId: cartItemModel.product.id));
                    },
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
