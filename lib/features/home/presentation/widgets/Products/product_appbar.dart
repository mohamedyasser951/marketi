import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.lightBoderColor.withValues(alpha: 0.2),
              padding: const EdgeInsets.all(8),
            ),
            icon: Icon(Icons.chevron_left),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.lightBoderColor.withValues(alpha: 0.2),

              padding: const EdgeInsets.all(8),
            ),
            icon: const Icon(Icons.share_outlined),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(8),
              backgroundColor: AppColors.lightBoderColor.withValues(alpha: 0.2),
            ),
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
