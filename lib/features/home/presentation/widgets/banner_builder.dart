import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/home/data/models/banner_model.dart';
import 'package:marketi/features/home/presentation/widgets/banner_item.dart';

class BannerBuilder extends StatelessWidget {
  final List<BannerModel> banners;
  const BannerBuilder({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.separated(
        itemCount: banners.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: BannerItem(banner: banners[index]),
        ),
      ),
    );
  }
}
