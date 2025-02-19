import 'package:marketi/core/network/api_error_handler.dart';
import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/home/data/datasources/remote/home_api_service.dart';
import 'package:marketi/features/home/data/models/banner_model.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:marketi/features/home/data/repositories/home_repo.dart';

class HomeRepoImplem extends HomeRepo {
  HomeApiService homeApiService;

  HomeRepoImplem({required this.homeApiService});

  @override
  Future<ApiResult<List<BannerModel>>> getBanners() async {
    try {
      return ApiResult.success(await homeApiService.getBanners());
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<List<ProductModel>>> getProducts() async {
    try {
      return ApiResult.success(await homeApiService.getProducts());
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }
}
