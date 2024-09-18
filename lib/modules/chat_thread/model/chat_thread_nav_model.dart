import 'dart:io';

class ChatThreadNavModel {
  final String? promptId;
  final String? customPrompt;
  final File? imageFile;

  const ChatThreadNavModel({
    required this.promptId,
    required this.customPrompt,
    this.imageFile,
  });
}
