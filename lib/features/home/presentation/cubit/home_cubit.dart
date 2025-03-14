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
  HomeCubit({required this.homeRepo}) : super(HomeState());

  Future<void> getBanners() async {
    emit(state.copyWith(bannersStatus: RequestStatus.loading));
    final result = await homeRepo.getBanners();
    result.when(
      success: (banners) {
        emit(
          state.copyWith(
            bannersStatus: RequestStatus.success,
            banners: banners,
          ),
        );
      },
      error: (errorModel) {
        emit(
          state.copyWith(
            bannersStatus: RequestStatus.error,
            errorMessage: errorModel.getAllErrorMessages(),
          ),
        );
      },
    );
  }

  Future<void> getCategories() async {
    emit(state.copyWith(categoriesStatus: RequestStatus.loading));
    final result = await homeRepo.getCategories();
    result.when(
      success: (categories) {
        emit(
          state.copyWith(
            categoriesStatus: RequestStatus.success,
            categories: categories,
          ),
        );
      },
      error: (errorModel) {
        emit(
          state.copyWith(
            categoriesStatus: RequestStatus.error,
            errorMessage: errorModel.getAllErrorMessages(),
          ),
        );
      },
    );
  }

  Future<void> getProducts() async {
    emit(state.copyWith(productsStatus: RequestStatus.loading));
    final result = await homeRepo.getProducts();
    result.when(
      success: (products) {
        emit(
          state.copyWith(
            productsStatus: RequestStatus.success,
            products: products,
          ),
        );
      },
      error: (errorModel) {
        log(errorModel.getAllErrorMessages());
        emit(
          state.copyWith(
            productsStatus: RequestStatus.error,
            errorMessage: errorModel.getAllErrorMessages(),
          ),
        );
      },
    );
  }
}
