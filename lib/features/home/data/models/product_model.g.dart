// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      discountPrice: json['discount_price'] as String,
      category: json['category'] as String,
      averageRating: (json['average_rating'] as num).toDouble(),
      productImage: json['primary_image_url'] as String?,
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount_price': instance.discountPrice,
      'category': instance.category,
      'average_rating': instance.averageRating,
      'primary_image_url': instance.productImage,
      'gallery': instance.gallery,
    };
