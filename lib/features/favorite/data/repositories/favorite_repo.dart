import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/favorite/data/models/favorite_model.dart';

abstract class FavoriteRepo {
  Future<ApiResult<List<FavoriteModel>>> getFavorite();
  Future<ApiResult<void>> addToFavorite(int productId);
  Future<ApiResult<void>> removeFromFavorite(int productId);
}
