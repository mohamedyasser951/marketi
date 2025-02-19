import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/banners_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/product_bloc_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getBanners()
        ..getProducts(),
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: 90,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Marketi'),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(child: BannersBlocBuilder()),
          // BannersBlocBuilder(),
          // ProductsBlocBuilder(),
        ]),
      ),
    );
  }
}
