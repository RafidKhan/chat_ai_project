import 'dart:io';

import 'package:chat_on/constant/chat_thread_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../model/chat_thread_model.dart';

class ChatThreadState {
  final TextEditingController messageController;
  final bool hasText;
  final ChatThreadType chatThreadType;
  final FocusNode focusNode;
  final String promptId;
  final List<ChatThreadModel> threads;
  final bool isReplyLoading;
  final bool speechToTextEnabled;
  final bool isListeningSpeech;
  final SpeechToText speechToText;
  final String speechToTextResult;
  final File? imageFile;

  const ChatThreadState({
    required this.messageController,
    required this.hasText,
    required this.chatThreadType,
    required this.focusNode,
    required this.promptId,
    required this.threads,
    required this.isReplyLoading,
    required this.speechToTextEnabled,
    required this.isListeningSpeech,
    required this.speechToText,
    required this.speechToTextResult,
    required this.imageFile,
  });

  ChatThreadState copyWith({
    bool? hasText,
    ChatThreadType? chatThreadType,
    String? promptId,
    List<ChatThreadModel>? threads,
    bool? isReplyLoading,
    bool? speechToTextEnabled,
    bool? isListeningSpeech,
    String? speechToTextResult,
    File? imageFile,
  }) {
    return ChatThreadState(
      messageController: messageController,
      focusNode: focusNode,
      speechToText: speechToText,
      hasText: hasText ?? this.hasText,
      chatThreadType: chatThreadType ?? this.chatThreadType,
      promptId: promptId ?? this.promptId,
      threads: threads ?? this.threads,
      isReplyLoading: isReplyLoading ?? this.isReplyLoading,
      speechToTextEnabled: speechToTextEnabled ?? this.speechToTextEnabled,
      isListeningSpeech: isListeningSpeech ?? this.isListeningSpeech,
      speechToTextResult: speechToTextResult ?? this.speechToTextResult,
      imageFile: imageFile ?? this.imageFile,
    );
  }

  ChatThreadState removeImageFile() {
    return ChatThreadState(
      messageController: messageController,
      focusNode: focusNode,
      speechToText: speechToText,
      hasText: hasText,
      chatThreadType: chatThreadType,
      promptId: promptId,
      threads: threads,
      isReplyLoading: isReplyLoading,
      speechToTextEnabled: speechToTextEnabled,
      isListeningSpeech: isListeningSpeech,
      speechToTextResult: speechToTextResult,
      imageFile: null,
    );
  }
}
