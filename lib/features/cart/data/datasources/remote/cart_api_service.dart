import 'package:dio/dio.dart';
import 'package:marketi/core/network/api_constant.dart';
import 'package:marketi/features/cart/data/models/add_to_cart_request_body.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:retrofit/retrofit.dart';
part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio) => _CartApiService(dio);

  @GET(ApiConstants.cart)
  Future<List<CartItemModel>> getCartItems();

  @POST(ApiConstants.cart)
  Future<CartItemModel> addToCart(
      @Body() AddToCartRequestBody addToCartRequestBody);

  @PUT("${ApiConstants.cart}/{cartId}/")
  Future<CartItemModel> updateCart(@Path("cartId") int cartId,
      @Body() AddToCartRequestBody addToCartRequestBody);

  @DELETE("${ApiConstants.cart}/{cartId}/")
  Future<void> removeFromCart(
    @Path("cartId") int cartId,
  );
}

//  {
//         "id": 1,
//         "product": {
//             "id": 5,
//             "name": "Canon 5D Camera",
//             "description": "The Canon EOS 5D Mark IV is a professional DSLR camera with a 30.4MP full-frame CMOS sensor, delivering stunning image quality and 4K video recording. Perfect for photographers and videographers, it features fast autofocus, Dual Pixel technology, and excellent low-light performance.",
//             "price": "2999.99",
//             "discount_price": "2499.99",
//             "category": "Electronics",
//             "average_rating": 0.0,
//             "primary_image_url": "http://127.0.0.1:8000/media/products/primary/Camera3x.png",
//             "gallery": []
//         },
//         "quantity": 1
//     },
