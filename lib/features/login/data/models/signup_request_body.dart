import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String email;
  final String name;
  final String password;
  @JsonKey(name: 'confirm_password')
  final String? confirmPassword;

  SignupRequestBody({
    required this.email,
    required this.name,
    required this.password,
    this.confirmPassword,
  });
  
  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}


// {
//   "email": "mohamedyasser11@gmail.com",
//   "password": "asd01207864540",
//   "confirm_password": "asd01207864540",
//   "name": "moyasser"
// }