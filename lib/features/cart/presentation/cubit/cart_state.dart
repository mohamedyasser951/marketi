part of 'cart_cubit.dart';

enum CartStatus { initial, loading, success, error }

extension CartStatusX on CartStatus {
  bool get isInitial => this == CartStatus.initial;
  bool get isLoading => this == CartStatus.loading;

  bool get isSuccess => this == CartStatus.success;
  bool get isError => this == CartStatus.error;
}

class CartState extends Equatable {
  final CartStatus status;
  final List<CartItemModel> cartItems;
  final String errorMessage;

  const CartState(
      {this.status = CartStatus.initial,
      this.cartItems = const [],
      this.errorMessage = ''});

  CartState copyWith({
    CartStatus? status,
    List<CartItemModel>? cartItems,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      cartItems: cartItems ?? this.cartItems,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, cartItems, errorMessage];
}
