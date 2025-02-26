import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/carts_builder.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("MyCart"),
        ),
        bottomSheet: BottomCheckoutView(),
        body: BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) =>
                current.status.isSuccess || current.status.isError,
            builder: (context, state) {
              if (state.status.isError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state.status.isSuccess) {
                return CartsBuilder(cartItems: state.cartItems);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}

class BottomCheckoutView extends StatelessWidget {
  const BottomCheckoutView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current.status.isSuccess || current.status.isError,
      builder: (context, state) {
        if (state.status.isSuccess && state.cartItems.isNotEmpty) {
          return BottomAppBar(
            height: 130.h,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: Column(
                spacing: 10.h,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SupTotal (${state.cartItems.length.toString()}items): ",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          "${computeTotalPrice(state.cartItems).toStringAsFixed(2)} \$",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ]),
                  AppButton(btnText: "checkout", onPress: () {}),
                ],
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  double computeTotalPrice(List<CartItemModel> items) {
    return items.fold<double>(
      0.0,
      (sum, item) => sum + (double.parse(item.product.price) * item.quantity),
    );
  }
}
