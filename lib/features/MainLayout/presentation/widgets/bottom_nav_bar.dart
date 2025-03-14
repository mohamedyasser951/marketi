import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/MainLayout/presentation/cubit/main_layout_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, currentIndex) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.greyColor,
            elevation: 10,
            onTap: (index) {
              context.read<NavigationCubit>().updateIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: 
              SvgPicture.asset(Assets.imagesHomeIcon,colorFilter: ColorFilter.mode(currentIndex == 0 ? AppColors.primaryColor : AppColors.greyColor, BlendMode.srcIn),)
              , label: "Home"),
              BottomNavigationBarItem(
                icon:  SvgPicture.asset(Assets.imagesCartIcon,colorFilter: ColorFilter.mode(currentIndex == 1 ? AppColors.primaryColor : AppColors.greyColor, BlendMode.srcIn),),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.imagesHeartIcon,colorFilter: ColorFilter.mode(currentIndex == 2 ? AppColors.primaryColor : AppColors.greyColor, BlendMode.srcIn),),
                label: "Favorite",
              ),
              BottomNavigationBarItem(icon: SvgPicture.asset(Assets.imagesMenuIcon,colorFilter: ColorFilter.mode(currentIndex == 3 ? AppColors.primaryColor : AppColors.greyColor, BlendMode.srcIn),), label: "Menu"),
            ],
          ),
        );
      },
    );
  }
}
