import 'dart:io';
import 'package:chat_on/constant/chat_thread_type.dart';
import 'package:chat_on/constant/constant_key.dart';
import 'package:chat_on/modules/chat_thread/controller/state/chat_thread_state.dart';
import 'package:chat_on/modules/chat_thread/model/chat_thread_model.dart';
import 'package:chat_on/modules/chat_thread/model/prompt_request.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../data_provider/pref_helper.dart';
import '../../../global/controllers/global_attempt_available_controller.dart';
import '../repository/chat_thread_interface.dart';
import '../repository/chat_thread_repository.dart';

final chatThreadController =
    StateNotifierProvider.autoDispose<ChatThreadController, ChatThreadState>(
        (ref) => ChatThreadController());

class ChatThreadController extends StateNotifier<ChatThreadState> {
  final IChatThreadRepository _chatThreadRepository = ChatThreadRepository();

  ChatThreadController()
      : super(
          ChatThreadState(
            messageController: TextEditingController(),
            focusNode: FocusNode(),
            hasText: false,
            chatThreadType: ChatThreadType.GPT_TURBO,
            promptId: "",
            threads: [],
            isReplyLoading: false,
            speechToTextEnabled: false,
            isListeningSpeech: false,
            speechToText: SpeechToText(),
            speechToTextResult: "",
            imageFile: null,
          ),
        ) {
    checkIfSpeechToTextEnabled();
    state.messageController.addListener(() {
      checkTextStatus();
    });
  }

  checkIfSpeechToTextEnabled() async {
    final bool isEnabled = await state.speechToText.initialize();
    state = state.copyWith(speechToTextEnabled: isEnabled);
  }

  void setPromptId(String? promptId) {
    state = state.copyWith(promptId: promptId ?? "");
  }

  void setDefaultPrompt(String? prompt) {
    if (prompt != null) {
      state.messageController.text = prompt;
    }
  }

  void checkTextStatus() {
    state = state.copyWith(hasText: state.messageController.text.isNotEmpty);
  }

  void clearTexts(BuildContext context) {
    state.messageController.clear();
    FocusScope.of(context).unfocus();
  }

  void setChatThreadType(ChatThreadType type) {
    state = state.copyWith(chatThreadType: type);
  }

  void requestFocus() {
    state.focusNode.requestFocus();
  }

  Future<void> sendMyChat(
    BuildContext context, {
    String? imageUrl,
  }) async {
    if (state.hasText) {
      String prompt = state.messageController.text.trim();
      if (imageUrl != null) {
        prompt = "$prompt\n${AppConstant.IMAGE_URL_IS.key} $imageUrl";
      }
      final chat = ChatThreadModel(
        userType: ChatUserType.USER_ME,
        promptId: state.promptId,
        prompt: prompt,
      );
      state = state.copyWith(threads: [...state.threads, chat]);
      clearTexts(context);
      state = state.copyWith(isReplyLoading: true);
      await _chatThreadRepository.chatWithAi(
        params: PromptRequest(
          promptId: state.promptId,
          customPrompt: prompt,
          fileUrl: imageUrl,
        ),
        onSuccess: (response) {
          state = state.copyWith(isReplyLoading: false);
          if(response.message?.imageUrl != null){
            final image = response.message?.imageUrl;
            if(image != null){
              reduceFreeToken(context);
              final chat = ChatThreadModel(
                userType: ChatUserType.USER_BOT,
                promptId: state.promptId,
                prompt: "",
                imageUrl: image
              );
              state = state.copyWith(threads: [...state.threads, chat]);
            }
          }
          if(response.message?.text != null){
            final replyFromBot = response.message?.text;
            if (replyFromBot != null) {
              reduceFreeToken(context);
              final chat = ChatThreadModel(
                userType: ChatUserType.USER_BOT,
                promptId: state.promptId,
                prompt: replyFromBot,
              );
              state = state.copyWith(threads: [...state.threads, chat]);
            }
          }
        },
      );
      state = state.copyWith(isReplyLoading: false);
    }
  }

  Future<void> uploadImage(
    BuildContext context, {
      required String aiType,
    required Function(String imageUrl) onSuccessFunction,
  }) async {
    ViewUtil.showLoader();
    await _chatThreadRepository.uploadImage(
      imageFile: state.imageFile!,
      onSuccess: (response) async{
        removeImageFile();
        if(response.data!.url != null && aiType == "FILES"){
          await _chatThreadRepository.chatWithAi(
              params: PromptRequest(
              promptId: state.promptId,
              customPrompt: "Give me summarization of this file",
              fileUrl: response.data!.filename,
          ), onSuccess: (response){
            final replyFromBot = response.message?.translate;
            reduceFreeToken(context);
            final prompt = ChatThreadModel(
              userType: ChatUserType.USER_ME,
              promptId: state.promptId,
              prompt: "Give me summarization of this file",
            );
            state = state.copyWith(threads: [...state.threads, prompt]);
            final chat = ChatThreadModel(
              userType: ChatUserType.USER_BOT,
              promptId: state.promptId,
              prompt: replyFromBot!,
            );
            Navigation.pop(context);
            state = state.copyWith(threads: [...state.threads, chat]);
          });
        } else if(response.data?.url != null) {
          await _chatThreadRepository.chatWithAi(
              params: PromptRequest(
                promptId: state.promptId,
                customPrompt: "",
                fileUrl: response.data!.url!,
              ),
              onSuccess: (response) async{
               state.messageController.text = response.message!.text!;
               Navigation.pop(context);
               final chatPromptId = await PrefHelper.getString(AppConstant.CHAT.key);
               setPromptId(chatPromptId);
               reduceFreeToken(context);
              });
          onSuccessFunction(response.data!.url!);
        }else{
          Navigation.pop(context);
        }
      },
    );
  }

  Future<void> sendYoutubeUrl(BuildContext context, {
    String? url}) async{
    ViewUtil.showLoader();
    await _chatThreadRepository.chatWithAi(
        params: PromptRequest(
          promptId: state.promptId,
          stream: true,
          customPrompt: "What is the video give me the summarization",
          fileUrl: url,
        ), onSuccess: (response) {
      reduceFreeToken(context);
      Navigator.pop(context);
      final replyFromBot = response.message!.translate;
      final prompt = ChatThreadModel(
        userType: ChatUserType.USER_ME,
        promptId: state.promptId,
        prompt: "What is the video give me the summarization",
      );
      state = state.copyWith(threads: [...state.threads, prompt]);
      final chat = ChatThreadModel(
        userType: ChatUserType.USER_BOT,
        promptId: state.promptId,
        prompt: replyFromBot!,
      );
      Navigation.pop(context);
      state = state.copyWith(threads: [...state.threads, chat]);
        });
  }

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

  void startListening(BuildContext context) async {
    state = state.copyWith(speechToTextResult: "");
    if (state.speechToTextEnabled) {
      await state.speechToText.listen(onResult: (result) {
        final String recognizedWords = result.recognizedWords;
        state = state.copyWith(speechToTextResult: recognizedWords);
      });
    }
  }

  void stopListening(BuildContext context) async {
    await state.speechToText.stop().then((value) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        state.messageController.text = state.speechToTextResult;
      });
    });
  }

  void reAsk(
    BuildContext context, {
    required ChatThreadModel chat,
  }) {
    state.messageController.text = chat.prompt;
    sendMyChat(
      context,
    );
  }

  void setImageFile(File imageFile) {
    state = state.copyWith(imageFile: imageFile);
  }

  void removeImageFile() {
    state = state.removeImageFile();
  }

  void checkImageAvailability(BuildContext context) {
    if (state.imageFile == null) {
      sendMyChat(context);
    } else {
      uploadImage(context,aiType: "", onSuccessFunction: (imageUrl) {
        'here is:: ${imageUrl}'.log();
        sendMyChat(context, imageUrl: imageUrl);
      });
    }
  }

  loadHistory({String? message,String? promptId, String? response}) {
    final userChat = ChatThreadModel(
      userType: ChatUserType.USER_ME,
      promptId: state.promptId,
      prompt: message!,
    );
    final responseChat = ChatThreadModel(
      userType: ChatUserType.USER_BOT,
      promptId: state.promptId,
      prompt: response!,
    );
    state = state.copyWith(threads: [userChat,responseChat]);
  }

  reduceFreeToken(BuildContext context) async{
    final userType =  await PrefHelper.getString(AppConstant.USER_TYPE.key);
    if(userType == "Free"){
      final stc = context.read(attemptController.notifier);
      stc.reduceToken();
    }
  }
}
