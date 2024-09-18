import 'package:chat_on/constant/chat_thread_type.dart';
import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/chat_thread/controller/chat_thread_controller.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreadTypeSection extends ConsumerWidget {
  const ThreadTypeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatThreadController);
    final controller = ref.read(chatThreadController.notifier);
    final ChatThreadType selectedThreadType = state.chatThreadType;
    return Container(
      color: KColor.secondary.color,
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 60.h,
      child: Row(
        children: List.generate(
          2,
          (index) {
            final String type =
                (index == 0) ? context.loc.gpt_turbo : context.loc.gpt_4;

            final String icon = (index == 0)
                ? KAssetName.wandToolPng.imagePath
                : KAssetName.thunderPng.imagePath;

            return Expanded(
              child: InkWell(
                onTap: () {
                  if (index == 0) {
                    controller.setChatThreadType(ChatThreadType.GPT_TURBO);
                  }

                  if (index == 1) {
                    controller.setChatThreadType(ChatThreadType.GPT_4);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: (index == 0 &&
                            selectedThreadType == ChatThreadType.GPT_TURBO)
                        ? KColor.accent.color
                        : (index == 1 &&
                                selectedThreadType == ChatThreadType.GPT_4)
                            ? KColor.accent.color
                            : KColor.gradient2.color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalImageLoader(
                          imagePath: icon,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        GlobalText(
                          str: type,
                          color: KColor.white.color,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
