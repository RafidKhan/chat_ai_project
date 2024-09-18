class PromptRequest {
  final String? promptId;

  //final String? type;
  //final bool? stream;
  final String? customPrompt;
  final String? fileUrl;

  //final String? voice;
  //final String? size;

  const PromptRequest({
    this.promptId,
    //this.type,
    //this.stream,
    this.customPrompt,
    this.fileUrl,
    //this.voice,
    //this.size,
  });

  factory PromptRequest.fromJson(Map<String, dynamic> json) => PromptRequest(
        promptId: json["promptId"] as String?,
        //type: json["type"] as String?,
        //stream: json["stream"] as bool?,
        customPrompt: json["customPrompt"] as String?,
    fileUrl: json["customFileUrl"] as String?,
        //voice: json["voice"] as String?,
        //size: json["size"] as String?,
      );

  Map<String, dynamic> toJson() {
    final map = {
      //"type": type,
      //"stream": stream,
      "customPrompt": customPrompt,
      //"voice": voice,
      //"size": size,
    };
    if ((promptId ?? "").trim().isNotEmpty) {
      map["promptId"] = promptId ?? "";
    }
    if (fileUrl != null) {
      map["customFileUrl"] = fileUrl ?? "";
    }

    return map;
  }
}
