import 'package:dio/dio.dart';
import 'package:marketi/core/network/api_constant.dart';
import 'package:marketi/features/home/data/models/banner_model.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) => _HomeApiService(dio);

  @GET(ApiConstants.banners)
  Future<List<BannerModel>> getBanners();

  @GET(ApiConstants.products)
  Future<List<ProductModel>> getProducts();
}