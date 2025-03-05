import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/skeleton.dart';

class ProfileInfoHeaderLoading extends StatelessWidget {
  const ProfileInfoHeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CircleAvatar(
          radius: 60,
          child: Skeleton(
            width: 60,
            height: 60,
          ),
        ),
        Skeleton(
          width: 100.w,
          height: 12.h,
        ),
        Skeleton(
          width: 150.w,
          height: 12.h,
        ),
      ],
    );
  }
}
