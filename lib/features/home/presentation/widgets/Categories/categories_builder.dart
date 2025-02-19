import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/presentation/widgets/Categories/category_item.dart';

class CategoriesBuilder extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesBuilder({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryItem(model: categories[index]),
      ),
    );
  }
}
