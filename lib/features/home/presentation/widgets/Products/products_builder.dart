import 'package:flutter/material.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:marketi/features/home/presentation/widgets/Products/product_item.dart';

class ProductsBuilder extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsBuilder({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.57,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => ProductItem(product: products[index]),
        childCount: products.length,
      ),
    );
  }
}
