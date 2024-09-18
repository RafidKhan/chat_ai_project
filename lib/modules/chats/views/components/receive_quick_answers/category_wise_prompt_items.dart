import 'package:chat_on/global/model/global_question_model.dart';
import 'package:chat_on/global/widget/global_question_component.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/chats/model/category_wise_ai_promts_response.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWisePromptItems extends StatelessWidget {
  final String categoryName;
  final List<CategoryWisePrompt> prompts;

  const CategoryWisePromptItems({
    super.key,
    required this.categoryName,
    required this.prompts,
  });

  @override
  Widget build(BuildContext context) {
    if (prompts.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      width: context.width,
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: categoryName,
            color: KColor.greyText.color,
            fontSize: 16,
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: prompts.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
            itemBuilder: (context, index) {
              final prompt = prompts[index];
              return GlobalQuestionComponent(
                model: GlobalQuestionModel(
                  question: prompt.title ?? "",
                  icon: prompt.backgroundImage ?? "",
                  promptId: prompt.id,
                  customPrompt: prompt.prompt,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
