import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/home/data/models/banner_model.dart';
import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<ApiResult<List<BannerModel>>> getBanners();
  Future<ApiResult<List<CategoryModel>>> getCategories();
  Future<ApiResult<List<ProductModel>>> getProducts();
}
