import 'package:dio/dio.dart';
import 'package:marketi/core/network/api_constant.dart';
import 'package:marketi/features/favorite/data/models/add_to_favorites_request.dart';
import 'package:marketi/features/favorite/data/models/favorite_model.dart';
import 'package:retrofit/retrofit.dart';
part 'favorite_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class FavoriteApiServices {
  factory FavoriteApiServices(Dio dio) => _FavoriteApiServices(dio);

  @GET(ApiConstants.favorites)
  Future<List<FavoriteModel>> getFavorite();

  @POST(ApiConstants.favorites)
  Future<void> addToFavorite(@Body() AddToFavoriteRequest addToFavoriteRequest);

  @DELETE("${ApiConstants.favorites}/{productId}/")
  Future<void> removeFromFavorite(@Path("productId") int productId);
}
