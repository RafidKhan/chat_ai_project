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
  UserId? userId;
  PromptId? promptId;
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
    UserId? userId,
    PromptId? promptId,
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
    userId: UserId.fromMap(json["userId"]),
    promptId: json["promptId"] == null ? null : PromptId.fromMap(json["promptId"]),
    request: json["request"],
    response: json["response"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "userId": userId!.toMap(),
    "promptId": promptId!.toMap(),
    "request": request,
    "response": response,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}

class PromptId {
  String? categoryId;
  String? tagId;
  TargetLanguage? targetLanguage;
  String? id;
  String? title;
  String? subTitle;
  String? description;
  String? shortDescription;
  String? icon;
  String? backgroundImage;
  String? aiType;
  PackageType? packageType;
  String? prompt;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PromptId({
    this.categoryId,
    this.tagId,
    this.targetLanguage,
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.shortDescription,
    this.icon,
    this.backgroundImage,
    this.aiType,
    this.packageType,
    this.prompt,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  PromptId copyWith({
    String? categoryId,
    String? tagId,
    TargetLanguage? targetLanguage,
    String? id,
    String? title,
    String? subTitle,
    String? description,
    String? shortDescription,
    String? icon,
    String? backgroundImage,
    String? aiType,
    PackageType? packageType,
    String? prompt,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      PromptId(
        categoryId: categoryId ?? this.categoryId,
        tagId: tagId ?? this.tagId,
        targetLanguage: targetLanguage ?? this.targetLanguage,
        id: id ?? this.id,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        description: description ?? this.description,
        shortDescription: shortDescription ?? this.shortDescription,
        icon: icon ?? this.icon,
        backgroundImage: backgroundImage ?? this.backgroundImage,
        aiType: aiType ?? this.aiType,
        packageType: packageType ?? this.packageType,
        prompt: prompt ?? this.prompt,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory PromptId.fromJson(String str) => PromptId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PromptId.fromMap(Map<String, dynamic> json) => PromptId(
    categoryId: json["categoryId"],
    tagId: json["tagId"],
    targetLanguage: targetLanguageValues.map[json["targetLanguage"]],
    id: json["_id"],
    title: json["title"],
    subTitle: json["subTitle"],
    description: json["description"],
    shortDescription: json["shortDescription"],
    icon: json["icon"],
    backgroundImage: json["backgroundImage"],
    aiType: json["aiType"],
    packageType: packageTypeValues.map[json["packageType"]],
    prompt: json["prompt"],
    isActive: json["isActive"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "categoryId": categoryId,
    "tagId": tagId,
    "targetLanguage": targetLanguageValues.reverse[targetLanguage],
    "_id": id,
    "title": title,
    "subTitle": subTitle,
    "description": description,
    "shortDescription": shortDescription,
    "icon": icon,
    "backgroundImage": backgroundImage,
    "aiType": aiType,
    "packageType": packageTypeValues.reverse[packageType],
    "prompt": prompt,
    "isActive": isActive,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}

enum PackageType {
  FREE,
  PAID
}

final packageTypeValues = EnumValues({
  "FREE": PackageType.FREE,
  "PAID": PackageType.PAID
});

enum TargetLanguage {
  EN
}

final targetLanguageValues = EnumValues({
  "en": TargetLanguage.EN
});

class UserId {
  Id? id;
  FirstName? firstName;
  LastName? lastName;
  Email? email;
  String? phoneNumber;
  Password? password;
  UserType? userType;
  String? dateOfBirth;
  String? profilePictureUrl;
  bool? isActive;
  List<dynamic>? addresses;
  List<dynamic>? paymentCard;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  FullName? fullName;

  UserId({
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

  UserId copyWith({
    Id? id,
    FirstName? firstName,
    LastName? lastName,
    Email? email,
    String? phoneNumber,
    Password? password,
    UserType? userType,
    String? dateOfBirth,
    String? profilePictureUrl,
    bool? isActive,
    List<dynamic>? addresses,
    List<dynamic>? paymentCard,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    FullName? fullName,
  }) =>
      UserId(
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

  factory UserId.fromJson(String str) => UserId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserId.fromMap(Map<String, dynamic> json) => UserId(
    id: idValues.map[json["_id"]],
    firstName: firstNameValues.map[json["firstName"]],
    lastName: lastNameValues.map[json["lastName"]],
    email: emailValues.map[json["email"]],
    phoneNumber: json["phoneNumber"],
    password: passwordValues.map[json["password"]],
    userType: userTypeValues.map[json["userType"]],
    dateOfBirth: json["dateOfBirth"],
    profilePictureUrl: json["profilePictureUrl"],
    isActive: json["isActive"],
    addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
    paymentCard: List<dynamic>.from(json["paymentCard"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    fullName: fullNameValues.map[json["fullName"]],
  );

  Map<String, dynamic> toMap() => {
    "_id": idValues.reverse[id],
    "firstName": firstNameValues.reverse[firstName],
    "lastName": lastNameValues.reverse[lastName],
    "email": emailValues.reverse[email],
    "phoneNumber": phoneNumber,
    "password": passwordValues.reverse[password],
    "userType": userTypeValues.reverse[userType],
    "dateOfBirth": dateOfBirth,
    "profilePictureUrl": profilePictureUrl,
    "isActive": isActive,
    "addresses": List<dynamic>.from(addresses!.map((x) => x)),
    "paymentCard": List<dynamic>.from(paymentCard!.map((x) => x)),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "fullName": fullNameValues.reverse[fullName],
  };
}

enum Email {
  ABUL_GMAIL_COM
}

final emailValues = EnumValues({
  "abul@gmail.com": Email.ABUL_GMAIL_COM
});

enum FirstName {
  ABUL
}

final firstNameValues = EnumValues({
  "Abul": FirstName.ABUL
});

enum FullName {
  EMPTY
}

final fullNameValues = EnumValues({
  " ": FullName.EMPTY
});

enum Id {
  THE_667_ADCB6_C9_D9_F5_B4_F54735_B8
}

final idValues = EnumValues({
  "667adcb6c9d9f5b4f54735b8": Id.THE_667_ADCB6_C9_D9_F5_B4_F54735_B8
});

enum LastName {
  MIA
}

final lastNameValues = EnumValues({
  "Mia": LastName.MIA
});

enum Password {
  THE_2_A_103_H_BX_H4_HO_N5_XWFN_SWVH_GIQZ6_D_AG_K_XG_GDT4_OK4_MKQ_M_IBXHJ_RK_NG
}

final passwordValues = EnumValues({
  "\u00242a\u002410\u00243.h.bxH4Ho/N5XWFNSwvh.Giqz6dAgKXgGDT4OK4mkqMIbxhjRkNG": Password.THE_2_A_103_H_BX_H4_HO_N5_XWFN_SWVH_GIQZ6_D_AG_K_XG_GDT4_OK4_MKQ_M_IBXHJ_RK_NG
});

enum UserType {
  USER
}

final userTypeValues = EnumValues({
  "USER": UserType.USER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}