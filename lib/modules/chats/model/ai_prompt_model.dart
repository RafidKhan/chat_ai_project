class AiPromptModel {
  String? message;
  int? nonce;
  int? status;
  List<PromptData>? data;
  Pagination? pagination;

  AiPromptModel({
    this.message,
    this.nonce,
    this.status,
    this.data,
    this.pagination,
  });

  factory AiPromptModel.fromJson(Map<String, dynamic> json) => AiPromptModel(
        message: json["message"] as String?,
        nonce: json["nonce"] as int?,
        status: json["status"] as int?,
        data: json["data"] == null
            ? null
            : List<PromptData>.from((json["data"] as List)
                .map((x) => PromptData.fromJson(x as Map<String, dynamic>))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "nonce": nonce,
        "status": status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class PromptData {
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
  CategoryId? categoryId;
  TagId? tagId;
  int? v;
  bool? isFavourite;

  PromptData({
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
    this.isFavourite,
    this.tagId,
  });

  factory PromptData.fromJson(Map<String, dynamic> json) => PromptData(
        id: json["_id"] as String?,
        title: json["title"] as String?,
        subTitle: json["subTitle"] as String?,
        description: json["description"] as String?,
        shortDescription: json["shortDescription"] as String?,
        icon: json["icon"] as String?,
        backgroundImage: json["backgroundImage"] as String?,
        aiType: json["aiType"] as String?,
        packageType: json["packageType"] as String?,
        prompt: json["prompt"] as String?,
        categoryId: json["categoryId"] == null
            ? null
            : CategoryId.fromJson(json["categoryId"] as Map<String, dynamic>),
    tagId: json["tagId"] == null
            ? null
            : TagId.fromJson(json["tagId"] as Map<String, dynamic>),
        v: json["__v"] as int?,
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
        "categoryId": categoryId?.toJson(),
        "tagId": tagId?.toJson(),
        "__v": v,
      };
}

class CategoryId {
  String? id;
  String? title;
  String? subTitle;
  String? description;
  String? shortDescription;
  String? backgroundImage;
  int? v;

  CategoryId({
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.shortDescription,
    this.backgroundImage,
    this.v,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json["_id"] as String?,
        title: json["title"] as String?,
        subTitle: json["subTitle"] as String?,
        description: json["description"] as String?,
        shortDescription: json["shortDescription"] as String?,
        backgroundImage: json["backgroundImage"] as String?,
        v: json["__v"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "shortDescription": shortDescription,
        "backgroundImage": backgroundImage,
        "__v": v,
      };
}

class TagId {
  String? id;
  String? title;
  String? subTitle;
  String? description;
  String? shortDescription;
  String? icon;
  String? backgroundImage;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  TagId({
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.shortDescription,
    this.icon,
    this.backgroundImage,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TagId.fromJson(Map<String, dynamic> json) => TagId(
        id: json["_id"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        shortDescription: json["shortDescription"],
        icon: json["icon"],
        backgroundImage: json["backgroundImage"],
        isActive: json["isActive"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
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
        "isActive": isActive,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class Pagination {
  int? totalElements;
  int? pageNumber;
  String? pageSize;
  int? totalPages;

  Pagination({
    this.totalElements,
    this.pageNumber,
    this.pageSize,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalElements: json["totalElements"] as int?,
        pageNumber: json["pageNumber"] as int?,
        pageSize: json["pageSize"] as String?,
        totalPages: json["totalPages"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "totalElements": totalElements,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalPages": totalPages,
      };
}
