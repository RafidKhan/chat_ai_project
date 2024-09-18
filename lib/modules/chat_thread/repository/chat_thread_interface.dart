import 'dart:io';

import 'package:chat_on/global/model/global_response.dart';
import 'package:chat_on/modules/chat_thread/model/prompt_request.dart';
import 'package:flutter/material.dart';

import '../model/chat_ai_response.dart';
import '../model/file_upload_response.dart';

@immutable
abstract class IChatThreadRepository {
  Future<void> chatWithAi({
    required PromptRequest params,
    required Function(ChatAiResponse response) onSuccess,
  });

  Future<void> uploadImage({
    required File imageFile,
    required Function(FileUploadResponse response) onSuccess,
  });
}




