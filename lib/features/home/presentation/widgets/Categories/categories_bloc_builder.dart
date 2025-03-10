import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/shimmer_loading.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/Categories/categories_builder.dart';
import 'package:marketi/features/home/presentation/widgets/Categories/categories_loading.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current.status.isGetCategoriesLoading ||
            current.status.isGetCategoriesSuccess ||
            current.status.isGetCategoriesError,
        builder: (context, state) {
          if (state.status.isGetCategoriesError) {
            return SizedBox.shrink();
          } else if (state.status.isGetCategoriesSuccess) {
            return CategoriesBuilder(categories: state.categories);
          } else {
            return ShimmerLoading(widget: CategoriesLoading());
          }
        });
  }
}
