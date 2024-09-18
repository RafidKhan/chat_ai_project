import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/chat_thread/model/chat_thread_nav_model.dart';
import 'package:chat_on/modules/chats/model/get_help_model.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_routes.dart';
import '../../../../../utils/navigation.dart';

class GetHelpItemFull extends StatelessWidget {
  final GetHelpModel model;

  const GetHelpItemFull({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigation.push(
          context,
          appRoutes: AppRoutes.chatThread,
          arguments: ChatThreadNavModel(
            promptId: model.promptId,
            customPrompt: model.customPrompt,
          ),
        );
      },
      child: Container(
        height: 300.h,
        width: 150.w,
        padding: EdgeInsets.all(20.r),
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              KColor.gradient1.color,
              KColor.gradient2.color,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalText(
              str: model.title,
              color: KColor.white.color,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 5.h,
            ),
            GlobalText(
              str: model.subTitle,
              color: KColor.greyText.color,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: GlobalImageLoader(
                imagePath: model.icon,
                color: model.iconColor,
                height: 80.h,
                imageFor: ImageFor.network,
              ),
            )
          ],
        ),
      ),
    );
  }
}
