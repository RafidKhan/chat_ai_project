import 'package:chat_on/global/widget/global_circular_loader.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/widget/global_image_loader.dart';
import '../../../../utils/styles/k_assets.dart';
import '../../controller/chat_thread_controller.dart';

class ChatThreadBottomSection extends ConsumerWidget {
  const ChatThreadBottomSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatThreadController);
    final controller = ref.read(chatThreadController.notifier);
    if (state.isReplyLoading) {
      return const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: GlobalCircularLoader(),
          ),
        ],
      );
    }
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
            width: context.width,
            color: KColor.secondary.color,
            child: Row(
              children: [
                if (state.imageFile != null) ...[
                  Badge(
                    label: InkWell(
                      onTap: () {
                        controller.removeImageFile();
                      },
                      child: Icon(
                        Icons.close,
                        size: 12.w,
                      ),
                    ),
                    child: GlobalImageLoader(
                      imagePath: state.imageFile!.path,
                      imageFor: ImageFor.file,
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: KColor.gradient2.color,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: state.focusNode,
                            controller: state.messageController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(
                              color: KColor.white.color,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: state.isListeningSpeech
                                  ? context.loc.listening
                                  : context.loc.type_message_here,
                              hintStyle: TextStyle(
                                color: KColor.greyText.color,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        !state.hasText
                            ? GlobalImageLoader(
                                imagePath: KAssetName.icScanPng.imagePath,
                                height: 20.h,
                                color: KColor.white.color,
                              )
                            : InkWell(
                                onTap: () {
                                  controller.clearTexts(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2.r),
                                  decoration: BoxDecoration(
                                    color: KColor.greyText.color,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.clear,
                                    size: 16,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                if (state.speechToTextEnabled) ...[
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: state.hasText
                        ? () {
                            controller.checkImageAvailability(context);
                          }
                        : null,
                    onLongPress: !state.hasText
                        ? () {
                            controller.setIsListeningStatus(
                              context,
                              value: true,
                            );
                          }
                        : null,
                    onLongPressEnd: !state.hasText
                        ? (data) {
                            controller.setIsListeningStatus(
                              context,
                              value: false,
                            );
                          }
                        : null,
                    child: Container(
                      height: 42.h,
                      width: 42.w,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: KColor.accent.color,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: GlobalImageLoader(
                        imagePath: !state.hasText
                            ? KAssetName.icMic2Png.imagePath
                            : KAssetName.sendPng.imagePath,
                        color: KColor.white.color,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
