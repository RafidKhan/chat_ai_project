import 'package:chat_on/modules/creative_ai/controller/state/creative_ai_state.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../chats/repository/chats_interface.dart';
import '../../chats/repository/chats_repository.dart';

final creativeAiController =
    StateNotifierProvider<CreativeAiController, CreativeAiState>(
  (ref) => CreativeAiController(),
);

class CreativeAiController extends StateNotifier<CreativeAiState> {
  final IChatsRepository _chatsRepository = ChatsRepository();

  CreativeAiController()
      : super(
          const CreativeAiState(
            isLoading: false,
            prompts: [],
          ),
        );

  Future<void> loadCreativeAiPrompts() async {
    state = state.copyWith(isLoading: true);
    await _chatsRepository.getFreeAiPrompts(
      onSuccess: (response) {
        final creativeAiPrompts = (response.data ?? [])
            .where((e) => e.tagId?.title == "Creative")
            .toList();
        state = state.copyWith(prompts: creativeAiPrompts);
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
