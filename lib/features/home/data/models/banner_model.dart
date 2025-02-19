import 'package:freezed_annotation/freezed_annotation.dart';
part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  final int id;
  final String image;
  final String title;
  final String link;

  BannerModel({
    required this.id,
    required this.image,
    required this.title,
    required this.link,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

/*
[
    {
        "id": 1,
        "image": "http://127.0.0.1:8000/media/banners/Offer_1.png",
        "title": "offer1",
        "link": ""
    }
]
 */
