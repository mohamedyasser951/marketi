import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_response_body.g.dart';
@JsonSerializable()
class SignupResponseBody {
  final String name;
  final String email;
  final String accessToken;
  final String refreshToken;

  SignupResponseBody({
    required this.name,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignupResponseBody.fromJson(Map<String, dynamic> json) => _$SignupResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseBodyToJson(this);
}


// {
//     "name": "moyasser",
//     "email": "mohamedyasser@gmail.com",
//     "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM5ODk5NjQyLCJpYXQiOjE3Mzk4OTkzNDIsImp0aSI6IjNmMDI5ZWIzMjg3MjRkNTRiNjM3ZjlmY2ZhNjkwMDkxIiwidXNlcl9pZCI6NX0.jjhOOcWPAnAAkA9FjC8kx1ZdsfZCqy8ZlyG2eX0v86g",
//     "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTk4NTc0MiwiaWF0IjoxNzM5ODk5MzQyLCJqdGkiOiIyOGYyOTFhMjRjMTA0MzFiOTFjNWYxMTgwZjE0MmQxZCIsInVzZXJfaWQiOjV9.MpUDtiZ6rY-K_2kM412a6OF9cXTaWzR1JWenv8sz2XE"
// }