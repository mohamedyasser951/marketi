import 'package:flutter/material.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_item.dart';

class CartsBuilder extends StatelessWidget {
  final List<CartItemModel> cartItems;
  const CartsBuilder({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
