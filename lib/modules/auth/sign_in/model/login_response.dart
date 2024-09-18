


class LoginResponse {
  String? message;
  int? nonce;
  int? status;
  String? token;

  LoginResponse({
    this.message,
    this.nonce,
    this.status,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    message: json["message"],
    nonce: json["nonce"],
    status: json["status"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "nonce": nonce,
    "status": status,
    "token": token,
  };
}
