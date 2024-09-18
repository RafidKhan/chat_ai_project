class CategoryWiseAiPromptsResponse {
  String? message;
  int? nonce;
  int? status;
  List<PromptCategory>? payload;

  CategoryWiseAiPromptsResponse({
    this.message,
    this.nonce,
    this.status,
    this.payload,
  });

  factory CategoryWiseAiPromptsResponse.fromJson(Map<String, dynamic> json) {
    return CategoryWiseAiPromptsResponse(
      message: json['message'],
      nonce: json['nonce'],
      status: json['status'],
      payload: json['payload'] == null
          ? []
          : (json['payload'] as List)
              .map((item) => PromptCategory.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'nonce': nonce,
      'status': status,
      'payload': payload == null
          ? []
          : payload!.map((category) => category.toJson()).toList(),
    };
  }
}

class PromptCategory {
  List<CategoryWisePrompt>? prompts;
  String? categoryId;
  String? categoryTitle;

  PromptCategory({
    this.prompts,
    this.categoryId,
    this.categoryTitle,
  });

  factory PromptCategory.fromJson(Map<String, dynamic> json) {
    return PromptCategory(
      prompts:
      json['prompts'] == null? []:
      (json['prompts'] as List)
          .map((item) => CategoryWisePrompt.fromJson(item))
          .toList(),
      categoryId: json['categoryId'],
      categoryTitle: json['categoryTitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prompts':prompts== null?[]: prompts!.map((prompt) => prompt.toJson()).toList(),
      'categoryId': categoryId,
      'categoryTitle': categoryTitle,
    };
  }
}

class CategoryWisePrompt {
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

  CategoryWisePrompt({
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
  });

  factory CategoryWisePrompt.fromJson(Map<String, dynamic> json) {
    return CategoryWisePrompt(
      id: json['_id'],
      title: json['title'],
      subTitle: json['subTitle'],
      description: json['description'],
      shortDescription: json['shortDescription'],
      icon: json['icon'],
      backgroundImage: json['backgroundImage'],
      aiType: json['aiType'],
      packageType: json['packageType'],
      prompt: json['prompt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'subTitle': subTitle,
      'description': description,
      'shortDescription': shortDescription,
      'icon': icon,
      'backgroundImage': backgroundImage,
      'aiType': aiType,
      'packageType': packageType,
      'prompt': prompt,
    };
  }
}
