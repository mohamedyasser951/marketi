import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/cart/data/models/add_to_cart_request_body.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';

abstract class CartRepo {
  Future<ApiResult<List<CartItemModel>>> getCartItems();

  Future<ApiResult<CartItemModel>> addToCart(
      AddToCartRequestBody addToCartRequestBody);

  Future<ApiResult<CartItemModel>> updateCart(
      int cartId, AddToCartRequestBody addToCartRequestBody);

  Future<ApiResult<void>> removeFromCart(int cartId);
}
