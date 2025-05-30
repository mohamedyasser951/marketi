import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/core/widgets/custome_error_widget.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/carts_builder.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("MyCart"),
      ),
      bottomSheet: BottomCheckoutView(),
      body: BlocBuilder<CartCubit, CartState>(
        buildWhen:
            (previous, current) =>
                current.status.isSuccess || current.status.isError,
        builder: (context, state) {
          if (state.status.isError) {
            return CustomErrorWidget(
              message: context.read<CartCubit>().state.errorMessage,
              onRetry: () => context.read<CartCubit>().getCartItems(),
            );
          } else if (state.status.isSuccess) {
            return CartsBuilder(cartItems: state.cartItems);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class BottomCheckoutView extends StatelessWidget {
  const BottomCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen:
          (previous, current) =>
              current.status.isSuccess || current.status.isError,
      builder: (context, state) {
        if (state.status.isSuccess && state.cartItems.isNotEmpty) {
          return BottomAppBar(
            height: 130.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                spacing: 10.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SupTotal (${state.cartItems.length.toString()}items): ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "${computeTotalPrice(state.cartItems).toStringAsFixed(2)} \$",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
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
