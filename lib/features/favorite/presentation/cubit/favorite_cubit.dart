import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/favorite/data/models/favorite_model.dart';
import 'package:marketi/features/favorite/data/repositories/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;
  FavoriteCubit({required this.favoriteRepo}) : super(const FavoriteState());

  Future<void> getFavorite() async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    final result = await favoriteRepo.getFavorite();
    result.when(
        success: (data) => emit(state.copyWith(favorites: data)),
        error: (errorModel) =>
            emit(state.copyWith(errorMessage: errorModel.message)));
  }

  Future<void> addToFavorite(int productId) async {
    final result = await favoriteRepo.addToFavorite(productId);
    result.when(success: (data) {
      getFavorite();
    }, error: (errorModel) {
      emit(state.copyWith(
          status: FavoriteStatus.failure, errorMessage: errorModel.message));
    });
  }

  Future<void> removeFromFavorite(int productId) async {
    final result = await favoriteRepo.removeFromFavorite(productId);
    result.when(success: (data) {
      getFavorite();
    }, error: (errorModel) {
      emit(state.copyWith(
          status: FavoriteStatus.failure, errorMessage: errorModel.message));
    });
  }
}
