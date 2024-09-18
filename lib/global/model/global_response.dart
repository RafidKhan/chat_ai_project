// To parse this JSON data, do
//
//     final globalResponse = globalResponseFromJson(jsonString);

import 'dart:convert';

GlobalResponse globalResponseFromJson(String str) => GlobalResponse.fromJson(json.decode(str));

String globalResponseToJson(GlobalResponse data) => json.encode(data.toJson());

class GlobalResponse {
  int? status;
  String? message;

  GlobalResponse({
    this.status,
    this.message,
  });

  factory GlobalResponse.fromJson(Map<String, dynamic> json) => GlobalResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
