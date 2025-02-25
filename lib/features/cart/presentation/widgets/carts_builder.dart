import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_item.dart';

class CartsBuilder extends StatelessWidget {
  final List<CartItemModel> cartItems;
  const CartsBuilder({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return cartItems.isEmpty
        ? Center(child: SvgPicture.asset(Assets.imagesCartEmpty))
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(8),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => CartItem(
              cartItemModel: cartItems[index],
            ),
          );
  }
}
