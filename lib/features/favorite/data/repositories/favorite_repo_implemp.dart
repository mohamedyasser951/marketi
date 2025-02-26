import 'package:marketi/core/network/api_error_handler.dart';
import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/favorite/data/datasources/remote/favorite_api_services.dart';
import 'package:marketi/features/favorite/data/models/favorite_model.dart';
import 'package:marketi/features/favorite/data/repositories/favorite_repo.dart';

class FavoriteRepoImplemp extends FavoriteRepo {
  FavoriteApiServices favoriteApiServices;
  FavoriteRepoImplemp({required this.favoriteApiServices});

  @override
  Future<ApiResult<List<FavoriteModel>>> getFavorite() async {
    try {
      return ApiResult.success(await favoriteApiServices.getFavorite());
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<void>> addToFavorite(int productId) async {
    try {
      return ApiResult.success(
          await favoriteApiServices.addToFavorite(productId));
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<void>> removeFromFavorite(int productId) async {
    try {
      return ApiResult.success(
          favoriteApiServices.removeFromFavorite(productId));
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }
}
