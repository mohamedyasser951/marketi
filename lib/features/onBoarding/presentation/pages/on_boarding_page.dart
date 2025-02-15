import 'package:flutter/material.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/onBoarding/data/models/on_boarding_model.dart';
import 'package:marketi/features/onBoarding/presentation/widgets/on_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> boardingData = [
    OnBoardingModel(
        title: "Welcome to Marketi",
        subTitle: "We're glad you're here.",
        image: Assets.imagesOnBoarding1),
    OnBoardingModel(
        title: "Easy to Buy",
        subTitle:
            "Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.",
        image: Assets.imagesOnBoarding2),
    OnBoardingModel(
        title: "Wonderful User Experience",
        subTitle:
            "Start exploring now and experience the convenience of online shopping at its best.",
        image: Assets.imagesOnBoarding3),
  ];
  PageController pageController = PageController();
  bool isLast = false;

  void submitStateOfOnBoarding() async {
    // SharedHelper.saveData(key: "onBoarding", value: true).then((value) {
    //   if (value) {
    //     naviagetAndKill(context: context, widget: SocialLogin());
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {
                      submitStateOfOnBoarding();
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: AppColors.primaryColor),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.4,
                child: PageView.builder(
                  onPageChanged: (value) {
                    if (value == boardingData.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  controller: pageController,
                  itemBuilder: ((context, index) =>
                      OnBoardingItem(model: boardingData[index])),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: boardingData.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.primaryColor,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        spacing: 4.0,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        if (isLast) {
                          submitStateOfOnBoarding();
                        } else {
                          pageController.nextPage(
                              duration: const Duration(microseconds: 100),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: Text(
                        "next",
                        style: TextStyle(color: AppColors.primaryColor),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
