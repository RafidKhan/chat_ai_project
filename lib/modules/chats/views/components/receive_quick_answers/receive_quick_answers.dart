import 'package:chat_on/global/widget/global_circular_loader.dart';
import 'package:chat_on/global/widget/global_no_data.dart';
import 'package:chat_on/modules/chats/controller/chats_controller.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../global/widget/global_text.dart';
import '../../../../../utils/styles/k_colors.dart';
import 'category_wise_prompt_items.dart';

class ReceiveQuickAnswers extends ConsumerWidget {
  const ReceiveQuickAnswers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatsController);
    if (state.isLoadingCategoryWisePrompts) {
      return const GlobalCircularLoader();
    }
    final promptCategories = state.promptCategories;
    if (promptCategories.isEmpty) {
      return const GlobalNoData();
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
            str: context.loc.receive_quick_answers,
            color: KColor.white.color,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: promptCategories.length,
            itemBuilder: (context, index) {
              final element = promptCategories[index];
              return  CategoryWisePromptItems(
                categoryName:element.categoryTitle??"",
                prompts: element.prompts??[],
              );
            },
          ),
        ],
      ),
    );
  }
}
