import 'dart:io';

import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/chats/controller/chats_controller.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/constant_key.dart';
import '../../data_provider/pref_helper.dart';
import '../../modules/chat_thread/model/chat_thread_nav_model.dart';
import '../../modules/chats/views/components/premium_custom_screens/premium_image_uploader.dart';
import '../../utils/app_routes.dart';
import '../../utils/navigation.dart';
import '../../utils/view_util.dart';

class HomeTypeQuestionComponent extends StatelessWidget {
  const HomeTypeQuestionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(chatsController);
        final controller = ref.read(chatsController.notifier);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 5.h,
              ),
              width: context.width,
              color: KColor.gradient2.color,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // height: 50,
                      // width: context.width * 0.74,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: KColor.accent2.color,
                        ),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async{
                              final chatPromptId = await PrefHelper.getString(AppConstant.CHAT.key);
                              Navigation.push(
                                context,
                                appRoutes: AppRoutes.chatThread,
                                arguments: ChatThreadNavModel(
                                  promptId: chatPromptId,
                                  customPrompt: null,
                                  aiType: "",
                                ),
                              );
                            },
                            child: GlobalText(
                              str: state.isListeningSpeech
                                  ? context.loc.listening
                                  : context.loc.type_message_here,
                              color: KColor.white.color,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (!state.isListeningSpeech) ...[
                            SizedBox(
                              width: 20.w,
                            ),
                            InkWell(
                              onTap: () async{
                                File? imageFile;
                                await ViewUtil.bottomSheet(
                                  context: context,
                                  content: PremiumImageUploader(
                                    onImageSelect: (file) {
                                      imageFile = file;
                                    },
                                  ),
                                ).then((value) async{
                                  if (imageFile != null) {
                                    final imageToTextPromptId =  await PrefHelper.getString(AppConstant.IMAGE_TO_TEXT_KEY.key);
                                    Navigation.push(
                                      context,
                                      appRoutes: AppRoutes.chatThread,
                                      arguments: ChatThreadNavModel(
                                          promptId: imageToTextPromptId,
                                          customPrompt: "",
                                          imageFile: imageFile,
                                          aiType: ""
                                      ),
                                    );
                                  }
                                });
                                //CustomBottomSheet.showCustomBottomSheet(context);
                              },
                              child: GlobalImageLoader(
                                imagePath: KAssetName.icScanPng.imagePath,
                                height: 20.h,
                                color: KColor.white.color,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  if (state.speechEnabled) ...[
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onLongPress: () {
                        controller.setIsListeningStatus(context, value: true);
                      },
                      onLongPressEnd: (data) {
                        controller.setIsListeningStatus(context, value: false);
                      },
                      child: Container(
                        height: 42.h,
                        width: 42.w,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: KColor.accent.color,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: GlobalImageLoader(
                          imagePath: KAssetName.icMic2Png.imagePath,
                          color: KColor.white.color,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
