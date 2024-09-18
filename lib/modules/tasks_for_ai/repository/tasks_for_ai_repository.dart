import 'dart:convert';

import 'package:chat_on/modules/tasks_for_ai/repository/tasks_for_ai_api.dart';
import 'package:chat_on/utils/extension.dart';

import '../../../global/model/global_response.dart';
import '../../chats/model/ai_prompt_model.dart';
import '../model/favourite_promots_response.dart';
import '../model/prompt_tags_response.dart';
import 'tasks_for_ai_interface.dart';

class TasksForAiRepository implements ITasksForAiRepository {
  final TasksForAiApi _api = TasksForAiApi();

  @override
  Future<void> getTagWiseAiPrompts({
    required String tagId,
    required Function(AiPromptModel response) onSuccess,
  }) async {
    await _api.getTagWiseAiPrompts(
      tagId: tagId,
      onSuccess: (response) {
        onSuccess(AiPromptModel.fromJson(response.data));
      },
    );
  }

  @override
  Future<void> getFavouriteAiPrompts({
    required Function(FavouritePromptsResponse response) onSuccess,
  }) async {
    await _api.getFavouriteAiPrompts(
      onSuccess: (response) {
        onSuccess(FavouritePromptsResponse.fromJson(response.data));
      },
    );
  }

  @override
  Future<void> setFavouritePrompt({
    required String promptId,
    required Function(GlobalResponse response) onSuccess,
  }) async {
    await _api.setFavouritePrompt(
      promptId: promptId,
      onSuccess: (response) {
        onSuccess(GlobalResponse.fromJson(response.data));
      },
    );
  }

  @override
  Future<void> deleteFavouritePrompt({
    required String promptId,
    required Function(GlobalResponse response) onSuccess,
  }) async {
    await _api.deleteFavouritePrompt(
      promptId: promptId,
      onSuccess: (response) {
        onSuccess(GlobalResponse.fromJson(response.data));
      },
    );
  }

  @override
  Future<void> getPromptTags({
    required Function(PromptTagsResponse response) onSuccess,
  }) async {
    await _api.getPromptTags(
      onSuccess: (response) {
        onSuccess(PromptTagsResponse.fromJson(response.data));
      },
    );
  }
}
