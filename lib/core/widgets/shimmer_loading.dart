import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget widget;
  const ShimmerLoading({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white.withValues(alpha: 0.4),
      child: widget,
    );
  }
}
