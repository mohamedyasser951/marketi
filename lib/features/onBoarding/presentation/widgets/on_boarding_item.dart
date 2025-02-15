import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/onBoarding/data/models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: AssetImage(
            model.image,
          ),
          width: 300,
          height: 230,
        ),
        const SizedBox(
          height: 40.0,
        ),
        Text(model.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 2,
          width: 100,
          color: AppColors.primaryColor,
        ),
        const SizedBox(
          height: 20.0,
        ),
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
