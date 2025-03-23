import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_item.dart';
import 'package:marketi/features/home/presentation/widgets/Products/products_details.dart';

class CartsBuilder extends StatelessWidget {
  final List<CartItemModel> cartItems;
  const CartsBuilder({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return cartItems.isEmpty
        ? EmptyCartView()
        : ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 120),
          itemCount: cartItems.length,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder:
              (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductsDetails(
                          productModel: cartItems[index].product,
                        );
                      },
                    ),
                  );
                },
                child: CartTile(item: cartItems[index]),
              ),
        );
  }
}

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 25.h,
        children: [
          SvgPicture.asset(Assets.imagesCartEmpty),
          Text(
            "Your Cart is Empty",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Check our big offers, fresh products\n and fill your cart with items",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
