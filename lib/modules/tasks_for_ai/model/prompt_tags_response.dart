class PromptTagsResponse {
  String? message;
  int? nonce;
  int? status;
  List<Datum>? data;
  Pagination? pagination;

  PromptTagsResponse({
    this.message,
    this.nonce,
    this.status,
    this.data,
    this.pagination,
  });

  factory PromptTagsResponse.fromJson(Map<String, dynamic> json) =>
      PromptTagsResponse(
        message: json["message"],
        nonce: json["nonce"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "nonce": nonce,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Datum {
  String? id;
  String? title;
  String? icon;
  int? v;

  Datum({
    this.id,
    this.title,
    this.icon,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
    icon: json["icon"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "icon": icon,
        "__v": v,
      };
}

class Pagination {
  int? totalElements;
  int? pageNumber;
  String? pageSize;
  dynamic totalPages;

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
