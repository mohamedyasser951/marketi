import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custome_error_widget.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/Products/products_builder.dart';
import 'package:marketi/features/home/presentation/widgets/Products/products_loading.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, RequestStatus>(
      selector: (state) => state.productsStatus,
      builder: (context, productsStatus) {
        if (productsStatus == RequestStatus.loading) {
          return ProductLoading();
        } else if (productsStatus == RequestStatus.error) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              message: context.read<HomeCubit>().state.errorMessage,
              onRetry: () => context.read<HomeCubit>().getProducts(),
            ),
          );
        } else if (productsStatus == RequestStatus.success) {
          final products = context.read<HomeCubit>().state.products;
          return ProductsBuilder(products: products);
        }
        return SizedBox.shrink();
      },
    );
  }
}
