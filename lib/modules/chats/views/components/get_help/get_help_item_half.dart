import 'dart:io';

import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/chats/model/get_help_model.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../global/widget/global_image_loader.dart';
import '../../../../../utils/app_routes.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../utils/styles/k_colors.dart';
import '../../../../../utils/view_util.dart';
import '../../../../chat_thread/model/chat_thread_nav_model.dart';
import '../../../model/premium_feature_model.dart';
import '../premium_custom_screens/premium_file_uploader.dart';
import '../premium_custom_screens/premium_image_uploader.dart';

class GetHelpItemHalf extends StatelessWidget {
  final GetHelpModel model;

  const GetHelpItemHalf({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        if(model.aiType == "SUMMARIZATION"){
         final item =  PremiumFeatureModel(
           title: '', subTitle: '',
           icon: '',
           promptId: model.promptId,
           customPrompt: '',
           aiType: "FILES",
         );
          await ViewUtil.bottomSheet(
            context: context,
            content: FileUploaderUi(item: item),
          );
        }else{
          Navigation.push(
            context,
            appRoutes: AppRoutes.chatThread,
            arguments: ChatThreadNavModel(
              promptId: model.promptId,
              customPrompt: model.customPrompt,
              aiType: model.aiType
            ),
          );
        }
      },
      child: Container(
        height: 120.h,
        width: 150.w,
        padding: EdgeInsets.all(20.r),
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          //color: KColor.secondary.color,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              KColor.gradient1.color,
              KColor.gradient2.color,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GlobalText(
                    str: model.title,
                    color: KColor.white.color,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: 10.w,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GlobalImageLoader(
                    imagePath: model.icon,
                    color: model.iconColor,
                    height: 30.h,
                    imageFor: ImageFor.network,
                  ),
                )
              ],
            ),
            const Spacer(),
            GlobalText(
              str: model.subTitle,
              color: KColor.greyText.color,
            ),
          ],
        ),
      ),
    );
  }
}
