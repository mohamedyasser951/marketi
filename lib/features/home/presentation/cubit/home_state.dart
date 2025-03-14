part of 'home_cubit.dart';

enum RequestStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final RequestStatus bannersStatus;
  final RequestStatus categoriesStatus;
  final RequestStatus productsStatus;
  final List<BannerModel> banners;
  final List<ProductModel> products;
  final List<CategoryModel> categories;
  final String errorMessage;

  const HomeState({
    this.bannersStatus = RequestStatus.initial,
    this.categoriesStatus = RequestStatus.initial,
    this.productsStatus = RequestStatus.initial,
    this.banners = const [],
    this.products = const [],
    this.categories = const [],
    this.errorMessage = '',
  });

  HomeState copyWith({
    RequestStatus? bannersStatus,
    RequestStatus? categoriesStatus,
    RequestStatus? productsStatus,
    List<BannerModel>? banners,
    List<ProductModel>? products,
    List<CategoryModel>? categories,
    String? errorMessage,
  }) {
    return HomeState(
      bannersStatus: bannersStatus ?? this.bannersStatus,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      productsStatus: productsStatus ?? this.productsStatus,
      banners: banners ?? this.banners,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        bannersStatus,
        categoriesStatus,
        productsStatus,
        banners,
        products,
        categories,
        errorMessage,
      ];
}
