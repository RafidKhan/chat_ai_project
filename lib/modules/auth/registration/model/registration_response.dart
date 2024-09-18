


class SignUpResponse {
  String? message;
  int? nonce;
  int? status;
  Payload? payload;

  SignUpResponse({
    this.message,
    this.nonce,
    this.status,
    this.payload,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    message: json["message"],
    nonce: json["nonce"],
    status: json["status"],
    payload: json["payload"] == null ? null : Payload.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "nonce": nonce,
    "status": status,
    "payload": payload?.toJson(),
  };
}

class Payload {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;
  String? userType;
  String? dateOfBirth;
  String? profilePictureUrl;
  bool? isActive;
  String? id;
  List<dynamic>? addresses;
  List<dynamic>? paymentCard;
  String? createdAt;
  String? updatedAt;
  int? v;

  Payload({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.userType,
    this.dateOfBirth,
    this.profilePictureUrl,
    this.isActive,
    this.id,
    this.addresses,
    this.paymentCard,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    password: json["password"],
    userType: json["userType"],
    dateOfBirth: json["dateOfBirth"],
    profilePictureUrl: json["profilePictureUrl"],
    isActive: json["isActive"],
    id: json["_id"],
    addresses: json["addresses"] == null ? [] : List<dynamic>.from(json["addresses"]!.map((x) => x)),
    paymentCard: json["paymentCard"] == null ? [] : List<dynamic>.from(json["paymentCard"]!.map((x) => x)),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "password": password,
    "userType": userType,
    "dateOfBirth": dateOfBirth,
    "profilePictureUrl": profilePictureUrl,
    "isActive": isActive,
    "_id": id,
    "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x)),
    "paymentCard": paymentCard == null ? [] : List<dynamic>.from(paymentCard!.map((x) => x)),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
