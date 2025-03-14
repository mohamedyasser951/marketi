import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/MainLayout/presentation/cubit/main_layout_cubit.dart';
import 'package:marketi/features/MainLayout/presentation/widgets/bottom_nav_bar.dart';
import 'package:marketi/features/cart/presentation/pages/cart_page.dart';
import 'package:marketi/features/favorite/presentation/pages/favorite_page.dart';
import 'package:marketi/features/home/presentation/pages/home_page.dart';
import 'package:marketi/features/settings/presentation/pages/profile_page.dart';

final List<Widget> _pages = [
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

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, currentIndex) {
        return WillPopScope(
          onWillPop: () async {
            final currentNavigator = _navigatorKeys[currentIndex].currentState;

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
                    return MaterialPageRoute(builder: (_) => _pages[index]);
                  },
                ),
              ),
            ),
            bottomNavigationBar: BottomNavBar(),
          ),
        );
      },
    );
  }
}
