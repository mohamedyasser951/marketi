import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marketi/features/cart/presentation/pages/cart_page.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

class ProductsDetails extends StatelessWidget {
  final ProductModel productModel;
  const ProductsDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.amber,
              child: AspectRatio(
                aspectRatio: 1.2,
                child: CachedNetworkImage(
                  imageUrl: productModel.productImage!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ProductDetailsInfo(productModel: productModel)
          ],
        ),
      ),
    );
  }
}

class ProductDetailsInfo extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailsInfo({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${productModel.price}LE",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CartPage();
                    }));
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ))
            ],
          ),
          Text(
            productModel.name,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final text = Text(
                productModel.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text,
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'Read more',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          Text("Select Size", style: Theme.of(context).textTheme.bodyLarge),
          ProductSizeView()
        ],
      ),
    );
  }
}

class ProductSizeView extends StatelessWidget {
  const ProductSizeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 4, children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text("S"),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text("M"),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text("L"),
      ),
    ]);
  }
}
