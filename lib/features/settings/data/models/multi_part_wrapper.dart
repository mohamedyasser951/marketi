import 'package:dio/dio.dart';

class MultipartFileWrapper {
  final MultipartFile file;

  MultipartFileWrapper(this.file);

  // Return the file itself (Retrofit will handle it)
  MultipartFile toJson() => file;
}
