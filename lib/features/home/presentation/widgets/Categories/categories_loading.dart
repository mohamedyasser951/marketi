import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/skeleton.dart';

class CategoriesLoading extends StatelessWidget {
  const CategoriesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) => CategoryLoadingItem(),
      ),
    );
  }
}

class CategoryLoadingItem extends StatelessWidget {
  const CategoryLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Skeleton(
            height: 90,
            width: 100,
          ),
          SizedBox(
            height: 6.h,
          ),
          Skeleton(
            height: 20,
            width: 50,
          ),
        ],
      ),
    );
  }
}
