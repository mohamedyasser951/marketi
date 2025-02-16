import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/features/onBoarding/data/models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(model.image),
        const SizedBox(
          height: 40.0,
        ),
        Text(model.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(
          child: Text(
            model.subTitle,
            maxLines: 3,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
