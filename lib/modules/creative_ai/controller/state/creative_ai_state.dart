import 'package:chat_on/modules/chats/model/ai_prompt_model.dart';

class CreativeAiState {
  final bool isLoading;
  final List<PromptData> prompts;

  const CreativeAiState({
    required this.isLoading,
    required this.prompts,
  });

  CreativeAiState copyWith({
    bool? isLoading,
    List<PromptData>? prompts,
  }) {
    return CreativeAiState(
      isLoading: isLoading ?? this.isLoading,
      prompts: prompts ?? this.prompts,
    );
  }
}
