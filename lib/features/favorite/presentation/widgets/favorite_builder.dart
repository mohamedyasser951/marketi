import 'package:flutter/material.dart';
import 'package:marketi/features/favorite/data/models/favorite_model.dart';
import 'package:marketi/features/favorite/presentation/widgets/favorite_item.dart';

class FavoriteBuilder extends StatelessWidget {
  final List<FavoriteModel> favorite;
  const FavoriteBuilder({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: favorite.length,
      itemBuilder: (context, index) =>
          FavoriteItem(favoriteModel: favorite[index]),
    );
  }
}
