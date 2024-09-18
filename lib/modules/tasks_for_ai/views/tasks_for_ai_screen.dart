import 'package:chat_on/global/widget/global_circular_loader.dart';
import 'package:chat_on/global/widget/global_no_data.dart';
import 'package:chat_on/modules/tasks_for_ai/controller/tasks_for_ai_controller.dart';
import 'package:chat_on/modules/tasks_for_ai/views/components/individual_task_widget.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/widget/try_on_premium.dart';
import '../model/task_model.dart';
import 'components/task_categories_widget.dart';

class TasksForAiScreen extends StatefulWidget {
  const TasksForAiScreen({Key? key}) : super(key: key);

  @override
  State<TasksForAiScreen> createState() => _TasksForAiScreenState();
}

class _TasksForAiScreenState extends State<TasksForAiScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      final controller = context.read(tasksForAiController.notifier);
      controller.setCategoryIndex(
        0,
        isInitialCall: true,
      );
      controller.callApis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(tasksForAiController);

      return SizedBox(
        width: context.width,
        child: Column(
          children: [
            const TasksCategoryWidget(),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: state.scrollController,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: const TryOnPremium(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Consumer(builder: (context, ref, child) {
                      final state = ref.watch(tasksForAiController);

                      if (state.isLoadingPrompts ||
                          state.isLoadingFavouritePrompts ||
                          state.isLoadingCategories) {
                        return const GlobalCircularLoader();
                      }
                      final controller =
                      ref.read(tasksForAiController.notifier);

                      final prompts = state.selectedCategoryIndex == 0
                          ? state.favouritePrompts
                          : state.allPrompts;
                      if (prompts.isEmpty) {
                        return const GlobalNoData();
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: prompts.length,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.h,
                          mainAxisSpacing: 10.w,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final prompt = prompts[index];
                          return IndividualTaskWidget(
                            taskModel: TaskModel(
                              promptId: prompt.id,
                              prompt: prompt.prompt,
                              title: prompt.title ?? "",
                              subTitle: prompt.subTitle ?? "",
                              isFavourite: prompt.isFavourite ?? false,
                              icon: prompt.icon ?? "",
                            ),
                            onTapFavourite: () {
                              if (prompt.isFavourite ?? false) {
                                controller.deleteFavouriteStatus(
                                  context,
                                  prompt: prompt,
                                );
                              } else {
                                controller.setFavouriteStatus(
                                  context,
                                  prompt: prompt,
                                );
                              }

                              setState(() {});
                            },
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
