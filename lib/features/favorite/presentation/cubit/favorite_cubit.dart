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
        success: (data) {
          emit(FavoriteState(favorites: data, status: FavoriteStatus.success));
        },
        error: (errorModel) => emit(state.copyWith(
            status: FavoriteStatus.failure, errorMessage: errorModel.message)));
  }

  Future<void> addToFavorite(int productId) async {
    // final newFavorite =
    //     state.favorites.firstWhere((e) => e.product.id == productId);
        
    // final updatedFavorites = List<FavoriteModel>.from(state.favorites)
    //   ..add(newFavorite);

    // emit(state.copyWith(
    //   favorites: updatedFavorites,
    //   status: FavoriteStatus.success,
    // ));

    final result = await favoriteRepo.addToFavorite(productId);
    result.when(success: (data) {
      getFavorite();
    }, error: (errorModel) {
      final revertedFavorites = List<FavoriteModel>.from(state.favorites)
        ..removeWhere((favorite) => favorite.id == productId);

      emit(state.copyWith(
          status: FavoriteStatus.failure,
          favorites: revertedFavorites,
          errorMessage: errorModel.message));
    });
  }

  Future<void> removeFromFavorite(int productId) async {
    //Optimistically update the state immediately
    final updatedFavorites =
        state.favorites.where((favorite) => favorite.id != productId).toList();

    emit(state.copyWith(
      favorites: updatedFavorites,
      status: FavoriteStatus.success,
    ));

    final result = await favoriteRepo.removeFromFavorite(productId);
    result.when(success: (data) {
      getFavorite();
    }, error: (errorModel) {
      getFavorite();

      emit(state.copyWith(
        status: FavoriteStatus.failure,
        errorMessage: errorModel.message,
      ));
    });
  }
}
