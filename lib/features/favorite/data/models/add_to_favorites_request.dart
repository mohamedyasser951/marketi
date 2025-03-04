class AddToFavoriteRequest {
  final String productId;

  AddToFavoriteRequest({required this.productId});

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
    };
  }
}
