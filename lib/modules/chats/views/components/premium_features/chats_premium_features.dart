import 'package:chat_on/constant/constant_key.dart';
import 'package:chat_on/global/widget/global_circular_loader.dart';
import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_no_data.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/chats/controller/chats_controller.dart';
import 'package:chat_on/modules/chats/views/components/premium_features/premium_feature_item.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../dashboard/views/components/bottom_sheet.dart';
import '../../../model/premium_feature_model.dart';

class ChatPremiumFeatures extends StatelessWidget {
  const ChatPremiumFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(chatsController);
      if (state.isLoadingPaidPrompts) {
        return const GlobalCircularLoader();
      }
      final paidPrompts = state.paidPrompts;

      return Container(
        width: context.width,
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GlobalText(
                  str: context.loc.premium_features,
                  color: KColor.white.color,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  width: 8.w,
                ),
                GlobalImageLoader(
                  imagePath: KAssetName.icCrownPng.imagePath,
                  height: 30.h,
                  width: 25.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            paidPrompts.isEmpty
                ? const GlobalNoData()
                : SizedBox(
                    height: 170.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: paidPrompts.map((e) {
                          //'here is:: ${e.aiType}'.log();
                          if(e.aiType == AppConstant.CHAT.key){
                            CustomBottomSheet.setChatPrompt(e.id!);
                          }
                          return PremiumFeatureItem(
                            item: PremiumFeatureModel(
                              title: e.title ?? "",
                              subTitle: e.subTitle ?? "",
                              icon: e.icon ?? "",
                              promptId: e.id,
                              customPrompt: e.prompt,
                              aiType: e.aiType,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )
          ],
        ),
      );
    });
  }
}
