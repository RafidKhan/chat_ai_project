import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/widget/global_radio.dart';

class GetProWeeklyAccess extends StatelessWidget {
  const GetProWeeklyAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: KColor.white.color),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: context.loc.weekly_access,
                  color: KColor.white.color,
                  fontWeight: FontWeight.w300,
                ),
                GlobalText(
                  str: "${context.loc.bdt} 750.00/week",
                  color: KColor.white.color,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
          const GlobalRadio(
            isSelected: true,
          ),
        ],
      ),
    );
  }
}
