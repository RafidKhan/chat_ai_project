import 'package:chat_on/global/widget/global_circular_loader.dart';
import 'package:chat_on/global/widget/global_no_data.dart';
import 'package:chat_on/modules/creative_ai/controller/creative_ai_controller.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../chats/model/get_help_model.dart';
import '../../chats/views/components/get_help/get_help_item_half.dart';
import '../../tasks_for_ai/model/task_model.dart';
import '../../tasks_for_ai/views/components/individual_task_widget.dart';

class CreativeAiScreen extends StatefulWidget {
  const CreativeAiScreen({super.key});

  @override
  State<CreativeAiScreen> createState() => _CreativeAiScreenState();
}

class _CreativeAiScreenState extends State<CreativeAiScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(creativeAiController.notifier);
    Future(() {
      controller.loadCreativeAiPrompts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(creativeAiController);
      if (state.isLoading) {
        return const GlobalCircularLoader();
      }
      if (state.prompts.isEmpty) {
        return const GlobalNoData();
      }
      return  GridView.builder(
        itemCount: state.prompts.length,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.h,
          mainAxisSpacing: 10.w,
        ),
        itemBuilder: (BuildContext context, int index) {
          final prompt = state.prompts[index];
          return GetHelpItemHalf(
            model: GetHelpModel(
              title: prompt.title??"",
              subTitle: prompt.subTitle??"",
              icon: prompt.icon??"",
              promptId: prompt.id,
              customPrompt: prompt.prompt,
            ),
          );
        },
      );
    });
  }
}
