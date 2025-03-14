import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custome_error_widget.dart';
import 'package:marketi/core/widgets/shimmer_loading.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/Categories/categories_builder.dart';
import 'package:marketi/features/home/presentation/widgets/Categories/categories_loading.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, RequestStatus>(
      selector: (state) => state.categoriesStatus,
      builder: (context, categoriesStatus) {
        if (categoriesStatus == RequestStatus.loading) {
          return ShimmerLoading(widget: CategoriesLoading());
        } 
        else if (categoriesStatus == RequestStatus.error) {
          return CustomErrorWidget(
            message: context.read<HomeCubit>().state.errorMessage,
            onRetry: () => context.read<HomeCubit>().getCategories(),
          );
        } 
        else if (categoriesStatus == RequestStatus.success) {
          final categories = context.read<HomeCubit>().state.categories;
          return CategoriesBuilder(categories: categories);
        }
        return SizedBox.shrink();
      },
    );
  }
}
