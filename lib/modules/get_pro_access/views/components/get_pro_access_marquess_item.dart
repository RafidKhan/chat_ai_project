import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetPremiumAccessMarqueeItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final Color? iconColor;

  const GetPremiumAccessMarqueeItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        color: KColor.secondary.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlobalImageLoader(
            imagePath: image,
            height: 35.h,
            color: iconColor,
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalText(
                str: title,
                color: KColor.white.color,
                fontSize: 14,
              ),
              GlobalText(
                str: subTitle,
                color: KColor.white.color,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ],
          )
        ],
      ),
    );
  }
}
