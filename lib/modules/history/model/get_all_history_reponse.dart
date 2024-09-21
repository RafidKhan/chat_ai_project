import 'dart:convert';

class GetAllHistoryResponse {
  String? message;
  int? nonce;
  int? status;
  List<History>? data;

  GetAllHistoryResponse({
    this.message,
    this.nonce,
    this.status,
    this.data,
  });

  GetAllHistoryResponse copyWith({
    String? message,
    int? nonce,
    int? status,
    List<History>? data,
  }) =>
      GetAllHistoryResponse(
        message: message ?? this.message,
        nonce: nonce ?? this.nonce,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory GetAllHistoryResponse.fromJson(String str) => GetAllHistoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllHistoryResponse.fromMap(Map<String, dynamic> json) => GetAllHistoryResponse(
    message: json["message"],
    nonce: json["nonce"],
    status: json["status"],
    data: List<History>.from(json["data"].map((x) => History.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "nonce": nonce,
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class History {
  String? id;
  User? userId;
  String? promptId;
  String? request;
  String? response;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  History({
    this.id,
    this.userId,
    this.promptId,
    this.request,
    this.response,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  History copyWith({
    String? id,
    User? userId,
    String? promptId,
    String? request,
    String? response,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      History(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        promptId: promptId ?? this.promptId,
        request: request ?? this.request,
        response: response ?? this.response,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory History.fromJson(String str) => History.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory History.fromMap(Map<String, dynamic> json) => History(
    id: json["_id"],
    userId: User.fromMap(json["userId"]),
    promptId: json["promptId"],
    request: json["request"],
    response: json["response"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "userId": userId!.toMap(),
    "promptId": promptId,
    "request": request,
    "response": response,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;
  String? userType;
  String? dateOfBirth;
  String? profilePictureUrl;
  bool? isActive;
  List<dynamic>? addresses;
  List<dynamic>? paymentCard;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? fullName;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.userType,
    this.dateOfBirth,
    this.profilePictureUrl,
    this.isActive,
    this.addresses,
    this.paymentCard,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.fullName,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? userType,
    String? dateOfBirth,
    String? profilePictureUrl,
    bool? isActive,
    List<dynamic>? addresses,
    List<dynamic>? paymentCard,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? fullName,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        userType: userType ?? this.userType,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
        isActive: isActive ?? this.isActive,
        addresses: addresses ?? this.addresses,
        paymentCard: paymentCard ?? this.paymentCard,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        fullName: fullName ?? this.fullName,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    password: json["password"],
    userType: json["userType"],
    dateOfBirth: json["dateOfBirth"],
    profilePictureUrl: json["profilePictureUrl"],
    isActive: json["isActive"],
    addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
    paymentCard: List<dynamic>.from(json["paymentCard"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    fullName: json["fullName"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "password": password,
    "userType": userType,
    "dateOfBirth": dateOfBirth,
    "profilePictureUrl": profilePictureUrl,
    "isActive": isActive,
    "addresses": List<dynamic>.from(addresses!.map((x) => x)),
    "paymentCard": List<dynamic>.from(paymentCard!.map((x) => x)),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "fullName": fullName,
  };
}
