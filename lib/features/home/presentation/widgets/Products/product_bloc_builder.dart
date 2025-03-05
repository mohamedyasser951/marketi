import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/shimmer_loading.dart';
import 'package:marketi/features/home/presentation/cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/Products/products_builder.dart';
import 'package:marketi/features/home/presentation/widgets/Products/products_loading.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current.status.isGetProductsLoading ||
          current.status.isGetProductsSuccess ||
          current.status.isGetProductsError,
      builder: (context, state) {
        if (state.status.isGetProductsError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else if (state.status.isGetProductsSuccess) {
          return ProductsBuilder(
            products: state.products,
          );
        } else {
          // return SliverToBoxAdapter(child: CircularProgressIndicator());
          return ShimmerLoading(widget: ProductLoading());
        }
      },
    );
  }
}
