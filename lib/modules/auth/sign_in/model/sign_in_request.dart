class SignInRequest {
  final String email;
  final String password;

  SignInRequest({
    required this.email,
    required this.password,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
