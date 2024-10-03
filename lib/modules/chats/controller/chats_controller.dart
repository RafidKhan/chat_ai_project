import 'package:chat_on/constant/constant_key.dart';
import 'package:chat_on/data_provider/pref_helper.dart';
import 'package:chat_on/modules/chats/controller/state/chats_state.dart';
import 'package:chat_on/utils/app_routes.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../chat_thread/model/chat_thread_nav_model.dart';
import '../repository/chats_interface.dart';
import '../repository/chats_repository.dart';

final chatsController = StateNotifierProvider<ChatsController, ChatState>(
    (ref) => ChatsController());

class ChatsController extends StateNotifier<ChatState> {
  final IChatsRepository _chatsRepository = ChatsRepository();

  ChatsController()
      : super(
          ChatState(
            isListeningSpeech: false,
            speechEnabled: false,
            speechToText: SpeechToText(),
            isLoadingFreePrompts: false,
            isLoadingPaidPrompts: false,
            isLoadingCategoryWisePrompts: false,
            freePrompts: [],
            paidPrompts: [],
            promptCategories: [],
            speechToTextResult: "",
          ),
        );

  void setIsListeningStatus(
    BuildContext context, {
    required bool value,
  }) {
    state = state.copyWith(isListeningSpeech: value);
    if (state.isListeningSpeech) {
      startListening(context);
    } else {
      stopListening(context);
    }
  }

  Future<void> initSpeechToText() async {
    final speechEnabled = await state.speechToText.initialize();
    state = state.copyWith(speechEnabled: speechEnabled);
  }

  void startListening(BuildContext context) async {
    state = state.copyWith(speechToTextResult: "");
    if (state.speechEnabled) {
      await state.speechToText.listen(onResult: (result) {
        final String recognizedWords = result.recognizedWords;
        state = state.copyWith(speechToTextResult: recognizedWords);
      });
    }
  }

  void stopListening(BuildContext context) async {
    await state.speechToText.stop().then((value) async{
      final chatPromptId = await PrefHelper.getString(AppConstant.CHAT.key);
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigation.push(
          context,
          appRoutes: AppRoutes.chatThread,
          arguments: ChatThreadNavModel(
            promptId: chatPromptId,
            customPrompt: state.speechToTextResult,
          ),
        );
      });
    });
  }

  Future<void> loadFreePrompts() async {
    state = state.copyWith(isLoadingFreePrompts: true);
    await _chatsRepository.getFreeAiPrompts(
      onSuccess: (response) {
        state = state.copyWith(freePrompts: response.data ?? []);
      },
    );
    state = state.copyWith(isLoadingFreePrompts: false);
  }

  Future<void> loadPaidPrompts() async {
    state = state.copyWith(isLoadingPaidPrompts: true);
    await _chatsRepository.getPaidAiPrompts(
      onSuccess: (response) {
        state = state.copyWith(paidPrompts: response.data ?? []);
      },
    );
    state = state.copyWith(isLoadingPaidPrompts: false);
  }

  Future<void> loadCategoryWisePrompts() async {
    state = state.copyWith(isLoadingCategoryWisePrompts: true);
    await _chatsRepository.getCategoryWiseAiPrompts(
      onSuccess: (response) {
        state = state.copyWith(promptCategories: response.payload ?? []);
      },
    );
    state = state.copyWith(isLoadingCategoryWisePrompts: false);
  }

  Future<void> callApis() async {
    await initSpeechToText();
    loadFreePrompts();
    loadPaidPrompts();
    loadCategoryWisePrompts();
  }
}
