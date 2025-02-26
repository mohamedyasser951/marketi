import 'package:flutter/material.dart';
import 'package:marketi/features/favorite/data/models/favorite_model.dart';
import 'package:marketi/features/favorite/presentation/widgets/favorite_item.dart';

class FavoriteBuilder extends StatelessWidget {
  final List<FavoriteModel> products;
  const FavoriteBuilder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: products.length,
      itemBuilder: (context, index) =>
          FavoriteItem(product: products[index].product),
    );
  }
}
