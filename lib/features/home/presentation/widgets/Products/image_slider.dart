import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/cache_network_image.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentImage;
  final List<String?> images;
  const ImageSlider({
    super.key,
    required this.onChange,
    required this.currentImage,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: images.length,
        onPageChanged: onChange,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CacheNetworkImage(
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: images[index]!,
          );
        },
      ),
    );
  }
}
