import 'package:chat_on/global/widget/global_circular_loader.dart';
import 'package:chat_on/modules/chats/controller/chats_controller.dart';
import 'package:chat_on/modules/chats/model/get_help_model.dart';
import 'package:chat_on/modules/chats/views/components/get_help/get_help_item_full.dart';
import 'package:chat_on/modules/chats/views/components/get_help/get_help_item_half.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../global/widget/global_no_data.dart';
import '../../../../../global/widget/global_text.dart';
import '../../../../../utils/styles/k_colors.dart';
import '../../../model/ai_prompt_model.dart';

class GetHelpWithTask extends StatelessWidget {
  const GetHelpWithTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(chatsController);
      if (state.isLoadingFreePrompts) {
        return const GlobalCircularLoader();
      }
      return Container(
        width: context.width,
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalText(
              str: context.loc.get_help_any_task,
              color: KColor.white.color,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 5.h,
            ),
            state.freePrompts.isEmpty
                ? const GlobalNoData()
                : SizedBox(
                    height: 250.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(state.freePrompts.length, (index) {
                          final element = state.freePrompts[index];
                          final int position = customCounter(index);
                          final title = element.title ?? "";
                          final subTitle = element.subTitle ?? "";
                          final icon = element.icon ?? "";
                          PromptData? nextElement;
                          String nextTitle = '';
                          String nextSubTitle = '';
                          String nextIcon = '';
                          if (index < (state.freePrompts.length - 1)) {
                            nextElement = state.freePrompts[index + 1];
                            nextTitle = nextElement.title ?? "";
                            nextSubTitle = nextElement.subTitle ?? "";
                            nextIcon = nextElement.icon ?? "";
                          }

                          if (position == 0) {
                            return GetHelpItemFull(
                              model: GetHelpModel(
                                title: title,
                                subTitle: subTitle,
                                icon: icon,
                                promptId: element.id,
                                customPrompt: element.prompt,
                                aiType: element.aiType
                              ),
                            );
                          }

                          if (position == 1) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GetHelpItemHalf(
                                  model: GetHelpModel(
                                    title: title,
                                    subTitle: subTitle,
                                    icon: icon,
                                    promptId: element.id,
                                    customPrompt: element.prompt,
                                    aiType: element.aiType
                                  ),
                                ),
                                if (nextElement != null)
                                  GetHelpItemHalf(
                                    model: GetHelpModel(
                                      title: nextTitle,
                                      subTitle: nextSubTitle,
                                      icon: nextIcon,
                                      promptId: nextElement.id,
                                      customPrompt: nextElement.prompt,
                                      aiType: element.aiType,
                                    ),
                                  ),
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        }),
                      ),
                    ),
                  ),
          ],
        ),
      );
    });
  }
}

int customCounter(int n) {
  if (n <= 2) {
    return n;
  } else {
    return n % 3;
  }
}
