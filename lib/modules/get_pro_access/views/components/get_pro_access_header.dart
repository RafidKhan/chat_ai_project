import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/widget/global_text.dart';

class GetProAccessHeader extends StatelessWidget {
  const GetProAccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Row(
        children: [
          GlobalText(
            str: context.loc.get,
            color: KColor.white.color,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: KColor.accent.color,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: GlobalText(
              str: context.loc.pro,
              color: KColor.white.color,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          GlobalText(
            str: context.loc.access,
            color: KColor.white.color,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
