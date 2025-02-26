import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/cart/data/models/add_to_cart_request_body.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/data/repositories/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartRepo cartRepo;
  CartCubit({required this.cartRepo}) : super(CartState());

  Future<void> getCartItems() async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await cartRepo.getCartItems();
    result.when(
      success: (data) {
        emit(state.copyWith(status: CartStatus.success, cartItems: data));
      },
      error: (errorModel) {
        emit(state.copyWith(
            status: CartStatus.error, errorMessage: errorModel.message));
      },
    );
  }

  Future<void> addToCart({required AddToCartRequestBody addToCartRequestBody}) async {
    final result = await cartRepo.addToCart(addToCartRequestBody);
    result.when(success: (data) {
      getCartItems();
    }, error: (errorModel) {
      emit(state.copyWith(
          status: CartStatus.error, errorMessage: errorModel.message));
    });
  }

  Future<void> updateCart(
      {required int cartId, required AddToCartRequestBody addToCartRequestBody}) async {
    final result = await cartRepo.updateCart(cartId, addToCartRequestBody);
    result.when(success: (data) {
      getCartItems();
    }, error: (errorModel) {
      emit(state.copyWith(
          status: CartStatus.error, errorMessage: errorModel.message));
    });
  }

  Future<void> removeFromCart({required int cartId}) async {
    final result = await cartRepo.removeFromCart(cartId);
    result.when(success: (data) {
      getCartItems();
    }, error: (errorModel) {
      emit(state.copyWith(
          status: CartStatus.error, errorMessage: errorModel.message));
    });
  }


}
