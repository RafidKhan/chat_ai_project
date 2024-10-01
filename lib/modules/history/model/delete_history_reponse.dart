import 'dart:convert';

class DeleteHistoryResponse {
  String? message;
  int? nonce;
  int? status;
  DeletedHistory? deletedHistory;

  DeleteHistoryResponse({
    this.message,
    this.nonce,
    this.status,
    this.deletedHistory,
  });

  DeleteHistoryResponse copyWith({
    String? message,
    int? nonce,
    int? status,
    DeletedHistory? deletedHistory,
  }) =>
      DeleteHistoryResponse(
        message: message ?? this.message,
        nonce: nonce ?? this.nonce,
        status: status ?? this.status,
        deletedHistory: deletedHistory ?? this.deletedHistory,
      );

  factory DeleteHistoryResponse.fromJson(String str) => DeleteHistoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteHistoryResponse.fromMap(Map<String, dynamic> json) => DeleteHistoryResponse(
    message: json["message"],
    nonce: json["nonce"],
    status: json["status"],
    deletedHistory: json["deletedHistory"] == null ? null : DeletedHistory.fromMap(json["deletedHistory"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "nonce": nonce,
    "status": status,
    "deletedHistory": deletedHistory?.toMap(),
  };
}

class DeletedHistory {
  String? id;
  String? userId;
  String? promptId;
  String? request;
  String? response;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  DeletedHistory({
    this.id,
    this.userId,
    this.promptId,
    this.request,
    this.response,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  DeletedHistory copyWith({
    String? id,
    String? userId,
    String? promptId,
    String? request,
    String? response,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      DeletedHistory(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        promptId: promptId ?? this.promptId,
        request: request ?? this.request,
        response: response ?? this.response,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory DeletedHistory.fromJson(String str) => DeletedHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeletedHistory.fromMap(Map<String, dynamic> json) => DeletedHistory(
    id: json["_id"],
    userId: json["userId"],
    promptId: json["promptId"],
    request: json["request"],
    response: json["response"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "userId": userId,
    "promptId": promptId,
    "request": request,
    "response": response,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}