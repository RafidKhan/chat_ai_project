import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/tasks_for_ai/model/task_model.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_routes.dart';
import '../../../../utils/navigation.dart';
import '../../../chat_thread/model/chat_thread_nav_model.dart';

class IndividualTaskWidget extends StatelessWidget {
  final TaskModel taskModel;
  final VoidCallback onTapFavourite;

  const IndividualTaskWidget({
    super.key,
    required this.taskModel,
    required this.onTapFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigation.push(
          context,
          appRoutes: AppRoutes.chatThread,
          arguments: ChatThreadNavModel(
            promptId: taskModel.promptId,
            customPrompt: taskModel.prompt,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              KColor.gradient1.color,
              KColor.gradient2.color,
            ],
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalImageLoader(
                  imagePath: taskModel.icon,
                  height: 40.h,
                  color: taskModel.iconColor,
                ),
                InkWell(
                  onTap: onTapFavourite,
                  child: GlobalImageLoader(
                    imagePath: taskModel.isFavourite
                        ? KAssetName.icFavouritePng.imagePath
                        : KAssetName.icNotFaveouritePng.imagePath,
                    height: 20.h,
                    color: KColor.white.color,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            GlobalText(
              str: taskModel.title,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: KColor.white.color,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.h,
            ),
            Flexible(
              child: GlobalText(
                str: taskModel.subTitle,
                color: KColor.greyText.color,
                maxLines: 3,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
