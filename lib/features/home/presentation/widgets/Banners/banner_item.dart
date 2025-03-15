import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/cache_network_image.dart';
import 'package:marketi/features/home/data/models/banner_model.dart';

class BannerItem extends StatelessWidget {
  final BannerModel banner;
  const BannerItem({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CacheNetworkImage(
        height: 140.h,
        width: 250.w,
        imageUrl: banner.image,
      ),
    );
  }
}
