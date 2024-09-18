import 'package:chat_on/modules/chats/repository/chats_api.dart';

import '../model/ai_prompt_model.dart';
import '../model/category_wise_ai_promts_response.dart';
import 'chats_interface.dart';

class ChatsRepository implements IChatsRepository {
  final ChatsApi _api = ChatsApi();

  @override
  Future<void> getFreeAiPrompts({
    required Function(AiPromptModel response) onSuccess,
  }) async {
    await _api.getFreeAiPrompts(
      onSuccess: (response) {
        onSuccess(AiPromptModel.fromJson(response.data));
      },
    );
  }

  @override
  Future<void> getPaidAiPrompts({
    required Function(AiPromptModel response) onSuccess,
  }) async {
    await _api.getPaidAiPrompts(
      onSuccess: (response) {
        onSuccess(AiPromptModel.fromJson(response.data));
      },
    );
  }

  @override
  Future<void> getCategoryWiseAiPrompts({
    required Function(CategoryWiseAiPromptsResponse response) onSuccess,
  }) async {
    await _api.getCategoryWiseAiPrompts(
      onSuccess: (response) {
        onSuccess(CategoryWiseAiPromptsResponse.fromJson(response.data));
      },
    );
  }
}
