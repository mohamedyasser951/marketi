import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_profile_model.g.dart';
@JsonSerializable()
class UserProfileModel {
  final int id;
  final String name;
  final String email;
  @JsonKey(name: "profile_image_url")
  final String profileImage;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);


  
}
