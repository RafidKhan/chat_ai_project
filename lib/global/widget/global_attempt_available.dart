import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global_text.dart';

class GlobalAttemptAvailable extends StatelessWidget {
  const GlobalAttemptAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: KColor.gradient2.color,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 2.h),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.rotationZ(
                3.1415926535897932*1.5,
              ),
              child: GlobalImageLoader(
                imagePath: KAssetName.threeStarPng.imagePath,
                height: 20.h,
                width: 20.w,
                color: KColor.white.color,
              ),
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          FittedBox(
            child: GlobalText(
              str: "20",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: KColor.white.color,
            ),
          ),
        ],
      ),
    );
  }
}
