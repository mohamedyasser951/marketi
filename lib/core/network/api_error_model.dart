import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(name: "detail")
  final String message;
  final int? code;
  Map<String, dynamic>? errors;

  ApiErrorModel({
    this.message = "Something went wrong",
    this.code,
    this.errors,
  });
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessages() {
    if (errors == null && errors?.values == null) {
      return message ;
    }
    final errorMessage = errors!.entries.map((entry) {
      final value = entry.value;
      return "${value.join(",")}";
    }).join("\n");
    return errorMessage;
  }
}
