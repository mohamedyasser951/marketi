import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/banner_model.dart';
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
      success: (data) {
        emit(state.copyWith(
          status: HomeStatus.getBannerSuccess,
          banners: data,
        ));
      },
      error: (errorModel) {
        emit(state.copyWith(
            status: HomeStatus.getBannerError,
            errorMessage: errorModel.getAllErrorMessages()));
      },
    );
  }

  Future<void> getProducts() async {
    emit(state.copyWith(status: HomeStatus.getProductsLoading));
    final result = await homeRepo.getProducts();
    result.when(
      success: (data) {
        log(data.length.toString());
        emit(state.copyWith(
          status: HomeStatus.getProductsSuccess,
          products: data,
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
