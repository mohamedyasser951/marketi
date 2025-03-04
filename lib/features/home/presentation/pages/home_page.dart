import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/Banners/banners_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/Categories/categories_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/Products/product_bloc_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getProducts()
        ..getBanners()
        ..getCategories(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                title: Text("Marketi"),
                centerTitle: true,
                elevation: 0,
                leading: null,
                backgroundColor: Colors.white,
              ),
              SliverToBoxAdapter(child: BannersBlocBuilder()),
              SliverToBoxAdapter(child: CategoriesBlocBuilder()),
              const ProductsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
