import 'package:flutter/material.dart';
import 'package:marketi/features/favorite/data/models/favorite_model.dart';
import 'package:marketi/features/favorite/presentation/widgets/favorite_item.dart';
import 'package:marketi/features/home/presentation/widgets/Products/products_details.dart';

class FavoriteBuilder extends StatelessWidget {
  final List<FavoriteModel> favorite;
  const FavoriteBuilder({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: favorite.length,
      itemBuilder:
          (context, index) => GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ProductsDetails(
                          productModel: favorite[index].product,
                        ),
                  ),
                ),
            child: FavoriteItem(favoriteModel: favorite[index]),
          ),
    );
  }
}
