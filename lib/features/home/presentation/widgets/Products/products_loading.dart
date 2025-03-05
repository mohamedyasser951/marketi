import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/skeleton.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2,
        childAspectRatio: 0.57,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => ProductLoadingItem(),
        childCount: 8,
      ),
    );
  }
}

class ProductLoadingItem extends StatelessWidget {
  const ProductLoadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Skeleton(
          height: 170,
          width: 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(
              height: 20,
              width: 50,
            ),
            Skeleton(
              height: 20,
              width: 50,
            ),
          ],
        ),
        Skeleton(
          height: 20,
          width: 100,
        ),
      ],
    );
  }
}
