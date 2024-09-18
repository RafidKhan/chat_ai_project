import 'dart:io';

import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/chats/model/premium_feature_model.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_routes.dart';
import '../../../../../utils/navigation.dart';
import '../../../../chat_thread/model/chat_thread_nav_model.dart';
import '../premium_custom_screens/premium_image_uploader.dart';

class PremiumFeatureItem extends StatelessWidget {
  final PremiumFeatureModel item;

  const PremiumFeatureItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (item.aiType == "IMAGETOTEXT") {
          File? imageFile;
          await ViewUtil.bottomSheet(
            context: context,
            content: PremiumImageUploader(
              onImageSelect: (file) {
                imageFile = file;
              },
            ),
          ).then((value) {
            if (imageFile != null) {
              Navigation.push(
                context,
                appRoutes: AppRoutes.chatThread,
                arguments: ChatThreadNavModel(
                  promptId: item.promptId,
                  customPrompt: item.customPrompt,
                  imageFile: imageFile,
                ),
              );
            }
          });
        } else {
          Navigation.push(
            context,
            appRoutes: AppRoutes.chatThread,
            arguments: ChatThreadNavModel(
              promptId: item.promptId,
              customPrompt: item.customPrompt,
            ),
          );
        }
      },
      child: Container(
        height: 170.h,
        width: 150.w,
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.only(top: 10.h, bottom: 20.h, right: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              KColor.gradient1.color,
              KColor.gradient2.color,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GlobalImageLoader(
                imagePath: item.icon,
                height: 70.h,
                color: item.iconColor,
                imageFor: ImageFor.network,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GlobalText(
                    str: item.title,
                    color: KColor.white.color,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GlobalText(
                    str: item.subTitle,
                    color: KColor.greyText.color,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
