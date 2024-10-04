// class ChatAiResponse {
//   final Message? message;
//   final int? nonce;
//   final int? status;
//
//   ChatAiResponse({
//     this.message,
//     this.nonce,
//     this.status,
//   });
//
//   factory ChatAiResponse.fromJson(Map<String, dynamic> json) {
//     return ChatAiResponse(
//       message: json['message'] != null ? Message.fromJson(json['message']) : null,
//       nonce: json['nonce'] as int?,
//       status: json['status'] as int?,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'message': message?.toJson(),
//       'nonce': nonce,
//       'status': status,
//     };
//   }
// }
//
//
//
// class Message {
//   final String? id;
//   final String? object;
//   final int? created;
//   final String? model;
//   final List<Choice>? choices;
//   final Usage? usage;
//   final dynamic systemFingerprint;
//
//   Message({
//     this.id,
//     this.object,
//     this.created,
//     this.model,
//     this.choices,
//     this.usage,
//     this.systemFingerprint,
//   });
//
//   factory Message.fromJson(Map<String, dynamic> json) {
//     return Message(
//       id: json['id'] as String?,
//       object: json['object'] as String?,
//       created: json['created'] as int?,
//       model: json['model'] as String?,
//       choices: (json['choices'] as List<dynamic>?)
//           ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       usage: json['usage'] != null ? Usage.fromJson(json['usage']) : null,
//       systemFingerprint: json['system_fingerprint'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'object': object,
//       'created': created,
//       'model': model,
//       'choices': choices?.map((e) => e.toJson()).toList(),
//       'usage': usage?.toJson(),
//       'system_fingerprint': systemFingerprint,
//     };
//   }
// }
//
// class Choice {
//   final int? index;
//   final MessageContent? message;
//   final dynamic logprobs;
//   final String? finishReason;
//
//   Choice({
//     this.index,
//     this.message,
//     this.logprobs,
//     this.finishReason,
//   });
//
//   factory Choice.fromJson(Map<String, dynamic> json) {
//     return Choice(
//       index: json['index'] as int?,
//       message: json['message'] != null
//           ? MessageContent.fromJson(json['message'])
//           : null,
//       logprobs: json['logprobs'],
//       finishReason: json['finish_reason'] as String?,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'index': index,
//       'message': message?.toJson(),
//       'logprobs': logprobs,
//       'finish_reason': finishReason,
//     };
//   }
// }
//
// class MessageContent {
//   final String? role;
//   final String? content;
//
//   MessageContent({
//     this.role,
//     this.content,
//   });
//
//   factory MessageContent.fromJson(Map<String, dynamic> json) {
//     return MessageContent(
//       role: json['role'] as String?,
//       content: json['content'] as String?,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'role': role,
//       'content': content,
//     };
//   }
// }
//
// class Usage {
//   final int? promptTokens;
//   final int? completionTokens;
//   final int? totalTokens;
//
//   Usage({
//     this.promptTokens,
//     this.completionTokens,
//     this.totalTokens,
//   });
//
//   factory Usage.fromJson(Map<String, dynamic> json) {
//     return Usage(
//       promptTokens: json['prompt_tokens'] as int?,
//       completionTokens: json['completion_tokens'] as int?,
//       totalTokens: json['total_tokens'] as int?,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'prompt_tokens': promptTokens,
//       'completion_tokens': completionTokens,
//       'total_tokens': totalTokens,
//     };
//   }
// }
//

// To parse this JSON data, do
//
//     final chatAiResponse = chatAiResponseFromJson(jsonString);

import 'dart:convert';

ChatAiResponse chatAiResponseFromJson(String str) => ChatAiResponse.fromJson(json.decode(str));

String chatAiResponseToJson(ChatAiResponse data) => json.encode(data.toJson());

class ChatAiResponse {
  Message? message;
  int? nonce;
  int? status;

  ChatAiResponse({
    this.message,
    this.nonce,
    this.status,
  });

  factory ChatAiResponse.fromJson(Map<String, dynamic> json) => ChatAiResponse(
    message: json["message"] == null ? null : Message.fromJson(json["message"]),
    nonce: json["nonce"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message?.toJson(),
    "nonce": nonce,
    "status": status,
  };
}

class Message {
  String? text;
  String? imageUrl;

  Message({
    this.text,
    this.imageUrl,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    text: json["text"],
    imageUrl: json["imageUrl"]
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "imageUrl" : imageUrl
  };
}
