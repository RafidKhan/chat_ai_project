import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/widget/global_image_loader.dart';
import '../../../../utils/styles/k_assets.dart';

class SplashInfo extends StatelessWidget {
  const SplashInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GlobalText(
          str: context.loc.powered_by,
          color: KColor.greyText.color,
          fontSize: 18,
        ),
        SizedBox(
          height: 20.h,
        ),
        // GlobalText(
        //   str: context.loc.travel_guide,
        //   color: KColor.accent.color,
        //   fontSize: 20,
        //   fontWeight: FontWeight.w600,
        // ),
        // SizedBox(
        //   height: 20.h,
        // ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: KColor.white.color,
            borderRadius: BorderRadius.circular(
              6.r,
            ),
          ),
          child: GlobalImageLoader(
            imagePath: KAssetName.textLogoPng.imagePath,
            height: 30.h,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
