import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                    color: AppColors.lightBlue700Color,
                    child: CachedNetworkImage(
                      height: 170,
                      width: 200,
                      fit: BoxFit.contain,
                      imageUrl: product.productImage!,
                    )),
              ),
              Row(
                children: [
                  Text("\$${product.price}", style: textTheme.bodyLarge),
                  Spacer(),
                  Text(
                    "${product.averageRating}",
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
              Text(product.name, style: textTheme.bodyLarge),
            ],
          ),
        ));
  }
}
