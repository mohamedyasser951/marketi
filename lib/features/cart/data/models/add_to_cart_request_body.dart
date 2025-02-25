class AddToCartRequestBody {
  final int productId;
  final int quantity;

  AddToCartRequestBody({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() => {'product_id': productId, 'quantity': quantity};
}