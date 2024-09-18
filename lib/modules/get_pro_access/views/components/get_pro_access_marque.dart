import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marqueer/marqueer.dart';

import '../../../../utils/styles/k_assets.dart';
import 'get_pro_access_marquess_item.dart';

class GetProAccessMarquee extends StatelessWidget {
  const GetProAccessMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Marqueer(
        pps: 50,
        direction: MarqueerDirection.rtl,
        restartAfterInteractionDuration: const Duration(seconds: 6),
        restartAfterInteraction: true,
        child: Row(
          children: [
            GetPremiumAccessMarqueeItem(
              title: context.loc.image_to,
              subTitle: context.loc.text_ocr,
              image: KAssetName.abcPng.imagePath,
            ),
            GetPremiumAccessMarqueeItem(
              title: context.loc.powered_by,
              subTitle: context.loc.gpt_4,
              image: KAssetName.robotPng.imagePath,
            ),
            GetPremiumAccessMarqueeItem(
              title: context.loc.unlimited,
              subTitle: context.loc.chat_messages,
              image: KAssetName.thoughtBubblePng.imagePath,
              iconColor: KColor.white.color,
            ),
            GetPremiumAccessMarqueeItem(
              title: context.loc.more_detailed,
              subTitle: context.loc.answers,
              image: KAssetName.shootingStarPng.imagePath,
            ),
            GetPremiumAccessMarqueeItem(
              title: context.loc.instant,
              subTitle: context.loc.responses,
              image: KAssetName.rocketPng.imagePath,
            ),
            GetPremiumAccessMarqueeItem(
              title: context.loc.chat,
              subTitle: context.loc.history,
              image: KAssetName.folderPng.imagePath,
              iconColor: KColor.white.color,
            ),
          ],
        ),
      ),
    );
  }
}
