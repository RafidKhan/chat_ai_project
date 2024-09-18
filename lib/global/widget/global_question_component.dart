import 'dart:io';

import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/app_routes.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/chat_thread/model/chat_thread_nav_model.dart';
import '../../modules/chats/views/components/premium_custom_screens/premium_image_uploader.dart';
import '../model/global_question_model.dart';

class GlobalQuestionComponent extends StatelessWidget {
  final GlobalQuestionModel model;

  const GlobalQuestionComponent({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: KColor.transparent.color,
      focusColor: KColor.transparent.color,
      highlightColor: KColor.transparent.color,
      onTap: () async{
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
        width: context.width,
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              KColor.gradient1.color,
              KColor.gradient2.color,
            ],
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GlobalText(
                str: model.question,
                color: KColor.white.color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            GlobalImageLoader(
              imagePath: model.icon,
              height: 35.h,
              imageFor: ImageFor.network,
            ),
          ],
        ),
      ),
    );
  }
}
