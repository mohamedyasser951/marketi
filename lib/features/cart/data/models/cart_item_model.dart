import 'package:marketi/features/home/data/models/product_model.dart';

class CartItemModel {
  int cartId;
  ProductModel product;
  int quantity;

  CartItemModel({
    required this.cartId, 
    required this.product,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        cartId: json["id"],
        product: ProductModel.fromJson(json["product"]),
        quantity: json["quantity"],
      );
}
