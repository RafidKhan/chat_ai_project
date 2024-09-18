import 'package:flutter/material.dart';

import '../model/ai_prompt_model.dart';
import '../model/category_wise_ai_promts_response.dart';

@immutable
abstract class IChatsRepository {
  Future<void> getFreeAiPrompts({
    required Function(AiPromptModel response) onSuccess,
  });

  Future<void> getPaidAiPrompts({
    required Function(AiPromptModel response) onSuccess,
  });

  Future<void> getCategoryWiseAiPrompts({
    required Function(CategoryWiseAiPromptsResponse response) onSuccess,
  });
}




