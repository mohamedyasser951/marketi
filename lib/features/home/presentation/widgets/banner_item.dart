import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/home/data/models/banner_model.dart';

class BannerItem extends StatelessWidget {
  final BannerModel banner;
  const BannerItem({
    super.key,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
          height: 130.h,
          width: 250.w,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageUrl: banner.image),
    );
  }
}
