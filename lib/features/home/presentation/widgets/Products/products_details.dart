import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:marketi/features/home/presentation/widgets/Products/add_to_cart.dart';
import 'package:marketi/features/home/presentation/widgets/Products/image_slider.dart';
import 'package:marketi/features/home/presentation/widgets/Products/product_appbar.dart';
import 'package:marketi/features/home/presentation/widgets/Products/product_info.dart';

class ProductsDetails extends StatefulWidget {
  final ProductModel productModel;
  const ProductsDetails({super.key, required this.productModel});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToCart(
        currentNumber: 1,
        onAdd: () {},
        onRemove: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductAppBar(),
              Stack(
                children: [
                  ImageSlider(
                    onChange: (index) {
                      setState(() {
                        currentImage = index;
                      });
                    },
                    currentImage: currentImage,
                    images: widget.productModel.images ?? [],
                  ),
                  widget.productModel.images!.length > 1
                      ? Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: List.generate(
                            widget.productModel.images!.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: currentImage == index ? 15 : 8,
                              height: 8,
                              margin: const EdgeInsets.only(right: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.lightBlue700Color,
                                ),
                                color:
                                    currentImage == index
                                        ? AppColors.lightBlue700Color
                                        : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      )
                      : const SizedBox(),
                ],
              ),
              ProductDetailsBody(widget: widget, currentImage: currentImage),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.widget,
    required this.currentImage,
  });

  final ProductsDetails widget;
  final int currentImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: AppColors.lightBoderColor.withValues(alpha: 0.2),
      ),
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductInfo(product: widget.productModel),
          const SizedBox(height: 10),
          Text(
            'Description',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ProductDetailsInfo(productModel: widget.productModel),
        ],
      ),
    );
  }
}

class ProductDetailsInfo extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailsInfo({super.key, required this.productModel});

  @override
  ProductDetailsInfoState createState() => ProductDetailsInfoState();
}

class ProductDetailsInfoState extends State<ProductDetailsInfo> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.productModel.description,
          maxLines: isExpanded ? null : 3,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Read less' : 'Read more',
            style: TextStyle(color: AppColors.lightBlue700Color),
          ),
        ),
      ],
    );
  }
}
