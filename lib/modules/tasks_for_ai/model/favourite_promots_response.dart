



class FavouritePromptsResponse {
  String? message;
  int? nonce;
  int? status;
  List<Payload>? payload;
  Pagination? pagination;

  FavouritePromptsResponse({
    this.message,
    this.nonce,
    this.status,
    this.payload,
    this.pagination,
  });

  factory FavouritePromptsResponse.fromJson(Map<String, dynamic> json) => FavouritePromptsResponse(
    message: json["message"],
    nonce: json["nonce"],
    status: json["status"],
    payload: json["payload"] == null ? [] : List<Payload>.from(json["payload"]!.map((x) => Payload.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "nonce": nonce,
    "status": status,
    "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  int? totalElements;
  int? pageNumber;
  int? pageSize;
  int? totalPages;

  Pagination({
    this.totalElements,
    this.pageNumber,
    this.pageSize,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalElements: json["totalElements"],
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "totalElements": totalElements,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalPages": totalPages,
  };
}

class Payload {
  String? id;
  PromptId? promptId;
  String? userId;
  int? v;

  Payload({
    this.id,
    this.promptId,
    this.userId,
    this.v,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["_id"],
    promptId: json["promptId"] == null ? null : PromptId.fromJson(json["promptId"]),
    userId: json["userId"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "promptId": promptId?.toJson(),
    "userId": userId,
    "__v": v,
  };
}

class PromptId {
  String? id;
  String? title;
  String? subTitle;
  String? description;
  String? shortDescription;
  String? icon;
  String? backgroundImage;
  String? aiType;
  String? packageType;
  String? prompt;
  String? categoryId;
  int? v;

  PromptId({
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
    this.categoryId,
    this.v,
  });

  factory PromptId.fromJson(Map<String, dynamic> json) => PromptId(
    id: json["_id"],
    title: json["title"],
    subTitle: json["subTitle"],
    description: json["description"],
    shortDescription: json["shortDescription"],
    icon: json["icon"],
    backgroundImage: json["backgroundImage"],
    aiType: json["aiType"],
    packageType: json["packageType"],
    prompt: json["prompt"],
    categoryId: json["categoryId"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "subTitle": subTitle,
    "description": description,
    "shortDescription": shortDescription,
    "icon": icon,
    "backgroundImage": backgroundImage,
    "aiType": aiType,
    "packageType": packageType,
    "prompt": prompt,
    "categoryId": categoryId,
    "__v": v,
  };
}
