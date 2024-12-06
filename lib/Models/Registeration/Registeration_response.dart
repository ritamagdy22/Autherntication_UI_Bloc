class RegistrationResponse {
  String id;
  String name;
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;

  RegistrationResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });

  // Convert a RegistrationResponse instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  // Convert a JSON object to a RegistrationResponse instance
  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      id: json['id'] ?? '', // Assuming 'id' is a string, if not adjust accordingly
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
    );
  }
}
