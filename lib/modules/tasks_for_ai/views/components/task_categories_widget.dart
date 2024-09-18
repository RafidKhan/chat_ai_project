import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../controller/tasks_for_ai_controller.dart';

class TasksCategoryWidget extends ConsumerWidget {
  const TasksCategoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tasksForAiController);
    final controller = ref.read(tasksForAiController.notifier);

    if (state.categories.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: EdgeInsets.only(
        top: 20.h,
      ),
      height: 50.h,
      child: ScrollablePositionedList.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.categories.length,
        itemBuilder: (context, index) {
          final item = state.categories[index];
          return InkWell(
            splashColor: KColor.transparent.color,
            focusColor: KColor.transparent.color,
            onTap: () {
              controller.setCategoryIndex(
                index,
                isInitialCall: false,
              );
              if (state.selectedCategoryIndex != index) {
                if ((state.favouritePrompts.isEmpty && index != 0) ||
                    state.favouritePrompts.isNotEmpty) {
                  controller.loadTagWisePromptsPrompts(
                    tagId: item.id??"",
                  );
                }
              }
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 20.w : 10.w,
                right: index == (state.categories.length - 1) ? 20.w : 0,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: state.selectedCategoryIndex == index
                    ? KColor.accent.color
                    : KColor.secondary.color,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                children: [
                  if (item.icon != null) ...[
                    GlobalImageLoader(
                      imagePath: item.icon ?? "",
                      height: 20.h,
                      color: KColor.white.color,
                      imageFor: ImageFor.network,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                  GlobalText(
                    str: item.title,
                    color: KColor.white.color,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          );
        },
        itemScrollController: controller.itemScrollController,
        scrollOffsetController: controller.scrollOffsetController,
        itemPositionsListener: controller.itemPositionsListener,
        scrollOffsetListener: controller.scrollOffsetListener,
      ),
    );
  }
}
