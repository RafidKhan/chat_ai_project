import 'package:chat_on/global/model/global_response.dart';
import 'package:flutter/material.dart';

import '../../chats/model/ai_prompt_model.dart';
import '../model/favourite_promots_response.dart';
import '../model/prompt_tags_response.dart';

@immutable
abstract class ITasksForAiRepository {
  Future<void> getTagWiseAiPrompts({
    required String tagId,
    required Function(AiPromptModel response) onSuccess,
  });

  Future<void> getFavouriteAiPrompts({
    required Function(FavouritePromptsResponse response) onSuccess,
  });

  Future<void> setFavouritePrompt({
    required String promptId,
    required Function(GlobalResponse response) onSuccess,
  });

  Future<void> deleteFavouritePrompt({
    required String promptId,
    required Function(GlobalResponse response) onSuccess,
  });

  Future<void> getPromptTags({
    required Function(PromptTagsResponse response) onSuccess,
  });
}




