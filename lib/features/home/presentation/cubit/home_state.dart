part of 'home_cubit.dart';

enum HomeStatus {
  homeIntial,
  getBannerloading,
  getBannerSuccess,
  getBannerError,
  getProductsLoading,
  getProductsSuccess,
  getProductsError,
}

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.homeIntial;
  bool get isGetBannerLoading => this == HomeStatus.getBannerloading;
  bool get isGetBannerSuccess => this == HomeStatus.getBannerSuccess;
  bool get isGetBannerError => this == HomeStatus.getBannerError;
  bool get isGetProductsLoading => this == HomeStatus.getProductsLoading;
  bool get isGetProductsSuccess => this == HomeStatus.getProductsSuccess;
  bool get isGetProductsError => this == HomeStatus.getProductsError;
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<BannerModel> banners;
  final List<ProductModel> products;
  final String errorMessage;

  const HomeState({
    this.status = HomeStatus.homeIntial,
    this.banners = const [],
    this.products = const [],
    this.errorMessage = '',
  });

  HomeState copyWith({
    HomeStatus? status,
    List<BannerModel>? banners,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      banners: banners ?? this.banners,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }



  @override
  List<Object> get props => [
        status,
        banners,
        products,
        errorMessage,
      ];
}
