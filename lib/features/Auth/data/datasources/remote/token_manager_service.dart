import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenManagerService {
  Future<void> saveTokens({String? accessToken, String? refreshToken});
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}

class TokenManagerServiceImplem implements TokenManagerService {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  Future<void> saveTokens({String? accessToken, String? refreshToken}) async {
    await storage.write(key: 'accessToken', value: accessToken);
    await storage.write(key: 'refreshToken', value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() {
    return storage.read(key: 'accessToken');
  }

  @override
  Future<String?> getRefreshToken() {
    return storage.read(key: 'refreshToken');
  }
}
