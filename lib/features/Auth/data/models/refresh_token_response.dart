class RefreshTokenResponse {
  String accessToken;
  RefreshTokenResponse({required this.accessToken});

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponse(accessToken: json['access']);

  Map<String, dynamic> toJson() => {
        'access': accessToken,
      };
}
