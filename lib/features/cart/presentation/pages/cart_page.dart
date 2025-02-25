import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/carts_builder.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MyCart"),
        ),
        body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
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
