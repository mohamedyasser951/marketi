import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CacheNetworkImage extends StatelessWidget {
  final double height, width;
  final String imageUrl;
  final BoxFit? fit;
  final double? radius;
  const CacheNetworkImage(
      {super.key,
      required this.height,
      required this.width,
      this.fit,
      this.radius,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius??10),
      child: CachedNetworkImage(
          height: height.h,
          width: width.w,
          fit: fit ?? BoxFit.cover,
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageUrl: imageUrl),
    );
  }
}
