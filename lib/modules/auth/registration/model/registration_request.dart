class RegistrationRequest {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;

  RegistrationRequest({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      RegistrationRequest(
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
      };
}
