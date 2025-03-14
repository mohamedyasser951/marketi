import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constants/assets_images.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/Banners/banners_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/Categories/categories_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/Products/product_bloc_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final homeCubit = context.read<HomeCubit>();
        await Future.wait([
          homeCubit.getBanners(),
          homeCubit.getCategories(),
          homeCubit.getProducts(),
        ]);
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  title: Text("Marketi"),
                  centerTitle: false,
                  elevation: 0,
                  actions: [SvgPicture.asset(Assets.imagesNotification)],
                ),

                SliverToBoxAdapter(child: BannersBlocBuilder()),
                CategorySeeAll(),
                SliverToBoxAdapter(child: CategoriesBlocBuilder()),
                PopularProductSeeAll(),
                const ProductsBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularProductSeeAll extends StatelessWidget {
  const PopularProductSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular Product",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Text(
              "View all",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySeeAll extends StatelessWidget {
  const CategorySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Text(
              "View all",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
