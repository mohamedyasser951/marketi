import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String description;
  final String price;
  @JsonKey(name: 'discount_price')
  final String discountPrice;
  final String category;
  @JsonKey(name: 'average_rating')
  final double averageRating;
  @JsonKey(name: 'primary_image_url')
  final String? productImage;
  final List<String?>? gallery;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountPrice,
    required this.category,
    required this.averageRating,
    required this.productImage,
    required this.gallery,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}



/*

  {
        "id": 1,
        "name": "apple",
        "description": "apple iphone the best",
        "price": "100.00",
        "discount_price": null,
        "category": "mobile",
        "average_rating": 0.0,
        "primary_image_url": null,
        "gallery": [
            {
                "image_url": "http://127.0.0.1:8000/media/products/gallery/1.jpg",
                "image_url": "http://127.0.0.1:8000/media/products/gallery/1.jpg"


            }
        ]
    },
 */