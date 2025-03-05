import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/MainLayout/presentation/cubit/main_layout_cubit.dart';
import 'package:marketi/features/cart/presentation/pages/cart_page.dart';
import 'package:marketi/features/favorite/presentation/pages/favorite_page.dart';
import 'package:marketi/features/home/presentation/pages/home_page.dart';
import 'package:marketi/features/settings/presentation/pages/profile_page.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  static final List<Widget> _pages = [
    HomePage(),
    CartPage(),
    FavoritePage(),
    ProfilePage(),
  ];
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return WillPopScope(
              onWillPop: () async {
                final currentNavigator =
                    _navigatorKeys[currentIndex].currentState;

                if (currentNavigator != null && currentNavigator.canPop()) {
                  currentNavigator.pop();
                  return false;
                }
                if (currentIndex != 0) {
                  context.read<NavigationCubit>().updateIndex(0);
                  return false;
                }
                return true;
              },
              child: Scaffold(
                  body: IndexedStack(
                    index: currentIndex,
                    children: List.generate(
                        _pages.length,
                        (index) => Navigator(
                              key: _navigatorKeys[index],
                              onGenerateRoute: (routeSettings) {
                                return MaterialPageRoute(
                                  builder: (_) => _pages[index],
                                );
                              },
                            )),
                  ),
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
                      ))));
        },
      ),
    );
  }
}
