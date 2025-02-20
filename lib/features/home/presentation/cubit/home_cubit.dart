import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/banner_model.dart';
import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:marketi/features/home/data/repositories/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit({required this.homeRepo})
      : super(HomeState(status: HomeStatus.homeIntial));

  Future<void> getBanners() async {
    emit(state.copyWith(status: HomeStatus.getBannerloading));
    final result = await homeRepo.getBanners();
    result.when(
      success: (banners) {
        emit(state.copyWith(
          status: HomeStatus.getBannerSuccess,
          banners: banners,
        ));
      },
      error: (errorModel) {
        emit(state.copyWith(
            status: HomeStatus.getBannerError,
            errorMessage: errorModel.getAllErrorMessages()));
      },
    );
  }

  Future<void> getCategories() async {
    emit(state.copyWith(status: HomeStatus.getCategoriesLoading));
    final result = await homeRepo.getCategories();
    result.when(
      success: (categories) {
        emit(state.copyWith(
          status: HomeStatus.getCategoriesSuccess,
          categories: categories,
        ));
      },
      error: (errorModel) {
        emit(state.copyWith(
            status: HomeStatus.getCategoriesError,
            errorMessage: errorModel.getAllErrorMessages()));
      },
    );
  }
  Future<void> getProducts() async {
    emit(state.copyWith(status: HomeStatus.getProductsLoading));
    final result = await homeRepo.getProducts();
    result.when(
      success: (products) {
        emit(state.copyWith(
          status: HomeStatus.getProductsSuccess,
          products: products,
        ));
      },
      error: (errorModel) {
        log(errorModel.getAllErrorMessages());
        emit(state.copyWith(
            status: HomeStatus.getProductsError,
            errorMessage: errorModel.getAllErrorMessages()));
      },
    );
  }
}
