import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel produc;
  const ProductItem({super.key, required this.produc});

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
                    child: Image.asset(Assets.imagesIPhone11Pro3x,
                        fit: BoxFit.cover, height: 170, width: 200)),
              ),
              Row(
                children: [
                  Text("Product Price", style: textTheme.bodyLarge),
                  Spacer(),
                  Text(
                    "rating",
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
              Text(" Product Name", style: textTheme.bodyLarge),
            ],
          ),
        ));
  }
}
