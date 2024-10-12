class GlobalQuestionModel {
  final String question;
  final String icon;
  final String? promptId;
  final String? customPrompt;
  final String? aiType;

  const GlobalQuestionModel({
    required this.question,
    required this.icon,
    required this.promptId,
    required this.customPrompt,
    required this.aiType
  });
}
