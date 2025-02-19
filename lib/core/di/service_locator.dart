import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/core/network/dio_factory.dart';
import 'package:marketi/features/Auth/data/datasources/remote/auth_api_service.dart';
import 'package:marketi/features/Auth/data/repositories/auth_repo.dart';
import 'package:marketi/features/Auth/data/repositories/auth_repo_implem.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
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

  //Repositories
  getIt.registerSingleton<AuthRepo>(AuthRepoImplem(authApiService: AuthApiService(dio)));
  getIt.registerSingleton<HomeRepo>(HomeRepoImplem(homeApiService: HomeApiService(dio)));

  //Services
  // getIt.registerSingleton<AuthApiService>(AuthApiService(dio));
  // getIt.registerSingleton<HomeApiService>(HomeApiService(dio));
}
