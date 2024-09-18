import 'package:speech_to_text/speech_to_text.dart';

import '../../model/ai_prompt_model.dart';
import '../../model/category_wise_ai_promts_response.dart';

class ChatState {
  final bool isListeningSpeech;
  final bool speechEnabled;
  final SpeechToText speechToText;
  final List<PromptData> freePrompts;
  final List<PromptData> paidPrompts;
  final List<PromptCategory> promptCategories;
  final bool isLoadingFreePrompts;
  final bool isLoadingPaidPrompts;
  final bool isLoadingCategoryWisePrompts;
  final String speechToTextResult;

  const ChatState({
    required this.isListeningSpeech,
    required this.speechEnabled,
    required this.speechToText,
    required this.freePrompts,
    required this.paidPrompts,
    required this.isLoadingFreePrompts,
    required this.isLoadingPaidPrompts,
    required this.isLoadingCategoryWisePrompts,
    required this.promptCategories,
    required this.speechToTextResult,
  });

  ChatState copyWith({
    bool? isListeningSpeech,
    bool? speechEnabled,
    List<PromptData>? freePrompts,
    List<PromptData>? paidPrompts,
    List<PromptCategory>? promptCategories,
    bool? isLoadingFreePrompts,
    bool? isLoadingPaidPrompts,
    bool? isLoadingCategoryWisePrompts,
    String? speechToTextResult,
  }) {
    return ChatState(
      isListeningSpeech: isListeningSpeech ?? this.isListeningSpeech,
      speechEnabled: speechEnabled ?? this.speechEnabled,
      speechToText: speechToText,
      freePrompts: freePrompts??this.freePrompts,
      paidPrompts: paidPrompts??this.paidPrompts,
      isLoadingFreePrompts: isLoadingFreePrompts??this.isLoadingFreePrompts,
      isLoadingPaidPrompts: isLoadingPaidPrompts??this.isLoadingPaidPrompts,
      isLoadingCategoryWisePrompts: isLoadingCategoryWisePrompts??this.isLoadingCategoryWisePrompts,
      promptCategories: promptCategories??this.promptCategories,
      speechToTextResult: speechToTextResult??this.speechToTextResult,
    );
  }
}
