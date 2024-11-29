class LoginResponse {
  final String token;

  LoginResponse({required this.token});

  // Method لتحويل JSON إلى object
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
    );
  }

  // Method لتحويل object إلى JSON (لو احتجت تبعته تاني في المستقبل)
  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
