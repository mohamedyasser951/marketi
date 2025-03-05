import 'package:dio/dio.dart';

class MultipartFileWrapper {
  final MultipartFile file;

  MultipartFileWrapper(this.file);

  Map<String, dynamic> toJson() {
    // Return an empty map as the file itself doesn't require JSON conversion.
    return {};
  }
}