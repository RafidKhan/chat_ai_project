class FileUploadResponse {
  String? message;
  int? nonce;
  int? status;
  Data? data;

  FileUploadResponse({
    this.message,
    this.nonce,
    this.status,
    this.data,
  });

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) =>
      FileUploadResponse(
        message: json["message"],
        nonce: json["nonce"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "nonce": nonce,
        "status": status,
        "payload": data?.toJson(),
      };
}

class Data {
  String? filename;
  String? originalname;
  String? mimetype;
  num? size;
  String? url;
  String? id;
  String? createdAt;
  int? v;

  Data({
    this.filename,
    this.originalname,
    this.mimetype,
    this.size,
    this.url,
    this.id,
    this.createdAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        filename: json["filename"],
        originalname: json["originalname"],
        mimetype: json["mimetype"],
        size: json["size"],
        url: json["url"],
        id: json["_id"],
        createdAt: json["createdAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "originalname": originalname,
        "mimetype": mimetype,
        "size": size,
        "url": url,
        "_id": id,
        "createdAt": createdAt,
        "__v": v,
      };
}
