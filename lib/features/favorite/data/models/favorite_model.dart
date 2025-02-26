import 'package:equatable/equatable.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

class FavoriteModel extends Equatable {
  final int id;
  final ProductModel product;
  final String createdAt;

  const FavoriteModel({
    required this.id,
    required this.product,
    required this.createdAt,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      product: ProductModel.fromJson(json['product']),
      createdAt: json['created_at'],
    );
  }
  @override
  List<Object?> get props => [id, product, createdAt];
}
