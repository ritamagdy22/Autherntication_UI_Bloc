class RegistrationRequest {
  String name;
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;

  RegistrationRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });

  // Convert a RegistrationRequest instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  // Convert a JSON object to a RegistrationRequest instance
  factory RegistrationRequest.fromJson(Map<String, dynamic> json) {
    return RegistrationRequest(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }
}
