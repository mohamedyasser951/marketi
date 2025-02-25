import 'package:marketi/core/network/api_error_handler.dart';
import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/cart/data/datasources/remote/cart_api_service.dart';
import 'package:marketi/features/cart/data/models/add_to_cart_request_body.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/data/repositories/cart_repo.dart';

class CartRepoImplem extends CartRepo {
  final CartApiService cartApiService;

  CartRepoImplem({required this.cartApiService});

  @override
  Future<ApiResult<List<CartItemModel>>> getCartItems() async {
    try {
      return ApiResult.success(await cartApiService.getCartItems());
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<CartItemModel>> addToCart(
      AddToCartRequestBody addToCartRequestBody) async {
    try {
      return ApiResult.success(
          await cartApiService.addToCart(addToCartRequestBody));
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<void>> removeFromCart(int cartId) async {
    try {
      return ApiResult.success(cartApiService.removeFromCart(cartId));
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<CartItemModel>> updateCart(
      int cartId, AddToCartRequestBody addToCartRequestBody) async {
    try {
      return ApiResult.success(
          await cartApiService.updateCart(cartId, addToCartRequestBody));
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }
}
