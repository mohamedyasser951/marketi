// {
//     "refresh": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTk4NTk5MywiaWF0IjoxNzM5ODk5NTkzLCJqdGkiOiJmMTgyM2MxNGY4Njk0NDViYTNjNDA1MjAxMjVlNmIxOSIsInVzZXJfaWQiOjV9.plbjTUQWvD9D6r_T-lXtU0VZzAGlrXdI202G3Ef_lS4",
//     "access": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM5ODk5ODkzLCJpYXQiOjE3Mzk4OTk1OTMsImp0aSI6IjkzOTk2ZjA5OGIwMzRjMDc4NmMwZmY0OWM0MDBhNDJmIiwidXNlcl9pZCI6NX0.BHgjnDC8fhQTqWfL-P9ECsGA07luQPJ3S0VTx0XqlLM"
// }
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final String refresh; // refresh token
  final String access; // access token

  LoginResponseBody({required this.refresh, required this.access});

  
  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>  _$LoginResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}
