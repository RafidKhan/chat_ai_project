import 'dart:io';

class ChatThreadNavModel {
  final String? promptId;
  final String? customPrompt;
  final File? imageFile;
  final String? promptResponse;
  final String? aiType;
  final String? url;

  const ChatThreadNavModel({
    required this.promptId,
    required this.customPrompt,
    this.imageFile,
    this.promptResponse,
    required this.aiType,
    this.url
  });
}
