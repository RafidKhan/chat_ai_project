import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhatIsNew extends StatelessWidget {
  const WhatIsNew({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 20.w,
        ),
        decoration: BoxDecoration(
          color: KColor.secondary.color,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: GlobalText(
                str: context.loc.what_is_new,
                color: KColor.white.color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              Icons.notifications,
              color: KColor.white.color,
            )
          ],
        ),
      ),
    );
  }
}
