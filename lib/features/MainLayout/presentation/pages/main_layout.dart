import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/MainLayout/presentation/cubit/main_layout_cubit.dart';
import 'package:marketi/features/cart/presentation/pages/cart_page.dart';
import 'package:marketi/features/favorite/presentation/pages/favorite_page.dart';
import 'package:marketi/features/home/presentation/pages/home_page.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  static final List<Widget> _pages = [
    HomePage(),
    CartPage(),
    FavoritePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: _pages[currentIndex],
            bottomNavigationBar: ClipRRect(
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
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: "Cart",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: "Favorite",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: "Menu",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
