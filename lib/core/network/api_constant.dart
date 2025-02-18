abstract class ApiConstants {
  static const String baseUrl = "http://127.0.0.1:8000/api/";
  static const String registre = 'auth/register/';
  static const String login = 'auth/login/';
  static const String tokenRefresh = '/auth/token/refresh/';
  static const String tokenVerify = '/auth/token/verify/';
  static const String logout = '/auth/logout/';
  static const String userProfile = '/auth/profile/';
  static const String products = '/products/';
  static const String categories = '/categories/';
  static const String banners = '/banners/';
  static const String favorites = '/favorites/';
  static const String cart = '/cart/';

  static String getFullUrl(String endpoint) =>
      '${ApiConstants.baseUrl}$endpoint';

  static String getFullUrlWithId(String endpoint, int id) =>
      '${ApiConstants.baseUrl}$endpoint$id/';

  static String getFullUrlWithQuery(String endpoint, String query) =>
      '${ApiConstants.baseUrl}$endpoint$query/';

  static String getFullUrlWithIdAndQuery(
          String endpoint, int id, String query) =>
      '${ApiConstants.baseUrl}$endpoint$id$query/';
}
