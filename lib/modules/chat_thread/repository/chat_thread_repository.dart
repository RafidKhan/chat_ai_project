import 'dart:convert';
import 'dart:io';

import 'package:chat_on/modules/chat_thread/repository/chat_thread_api.dart';
import 'package:chat_on/utils/extension.dart';

import '../../../global/model/global_response.dart';
import '../model/chat_ai_response.dart';
import '../model/file_upload_response.dart';
import '../model/prompt_request.dart';
import 'chat_thread_interface.dart';

class ChatThreadRepository implements IChatThreadRepository {
  final ChatThreadApi _api = ChatThreadApi();

  @override
  Future<void> chatWithAi({
    required PromptRequest params,
    required Function(ChatAiResponse response) onSuccess,
  }) async {
    await _api.chatWithAi(
      params: params.toJson(),
      onSuccess: (response) {
        onSuccess(ChatAiResponse.fromJson(response.data));
      },
    );
  }

  @override
  Future<void> uploadImage({
    required File imageFile,
    required Function(FileUploadResponse response) onSuccess,
  }) async {
    await _api.uploadImage(
      imageFile: imageFile,
      onSuccess: (response) {
        onSuccess(FileUploadResponse.fromJson(response.data));
      },
    );
  }
}
