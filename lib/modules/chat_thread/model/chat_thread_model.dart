import 'package:chat_on/utils/enum.dart';

class ChatThreadModel {
  final ChatUserType userType;
  final String? promptId;
  final String prompt;

  const ChatThreadModel({
    required this.userType,
    required this.promptId,
    required this.prompt,
  });
}
