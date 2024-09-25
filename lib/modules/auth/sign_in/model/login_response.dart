
class LoginResponse {
  String? message;
  int? nonce;
  int? status;
  String? token;
  int? availableToken;
  String? userType;

  LoginResponse({
    this.message,
    this.nonce,
    this.status,
    this.token,
    this.availableToken,
    this.userType,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    message: json["message"],
    nonce: json["nonce"],
    status: json["status"],
    token: json["token"],
    availableToken: json["availableToken"],
    userType: json["userType"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "nonce": nonce,
    "status": status,
    "token": token,
    "availableToken" : availableToken,
    "userType" : userType,
  };
}
