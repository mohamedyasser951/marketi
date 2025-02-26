import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/core/network/dio_factory.dart';
import 'package:marketi/features/Auth/data/datasources/remote/auth_api_service.dart';
import 'package:marketi/features/Auth/data/repositories/auth_repo.dart';
import 'package:marketi/features/Auth/data/repositories/auth_repo_implem.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:marketi/features/cart/data/datasources/remote/cart_api_service.dart';
import 'package:marketi/features/cart/data/repositories/cart_repo.dart';
import 'package:marketi/features/cart/data/repositories/cart_repo_implem.dart';
import 'package:marketi/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketi/features/favorite/data/datasources/remote/favorite_api_services.dart';
import 'package:marketi/features/favorite/data/repositories/favorite_repo.dart';
import 'package:marketi/features/favorite/data/repositories/favorite_repo_implemp.dart';
import 'package:marketi/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:marketi/features/home/data/datasources/remote/home_api_service.dart';
import 'package:marketi/features/home/data/repositories/home_repo.dart';
import 'package:marketi/features/home/data/repositories/home_repo_implem.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  Dio dio = DioFactory.getDio();
  //Cubits
  getIt.registerFactory<AuthCubit>(() => AuthCubit(authRepo: getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(homeRepo: getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(cartRepo: getIt()));
  getIt.registerFactory<FavoriteCubit>(
      () => FavoriteCubit(favoriteRepo: getIt()));

  //Repositories
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImplem(authApiService: AuthApiService(dio)));
  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepoImplem(homeApiService: HomeApiService(dio)));
  getIt.registerLazySingleton<CartRepo>(
      () => CartRepoImplem(cartApiService: CartApiService(dio)));
  getIt.registerLazySingleton<FavoriteRepo>(
      () => FavoriteRepoImplemp(favoriteApiServices: getIt()));

  // Services
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio));
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<CartApiService>(() => CartApiService(dio));
  getIt.registerLazySingleton<FavoriteApiServices>(
      () => FavoriteApiServices(dio));
}
