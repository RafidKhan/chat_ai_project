import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/widget/global_radio.dart';

class GetProYearlyAccess extends StatelessWidget {
  const GetProYearlyAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 12.h,
          ),
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
                      str: context.loc.yearly_access,
                      color: KColor.white.color,
                      fontWeight: FontWeight.w300,
                    ),
                    GlobalText(
                      str: "${context.loc.bdt} 4,200.00/week",
                      color: KColor.white.color,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              const GlobalRadio(
                isSelected: false,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(
              right: 60.w,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: KColor.accent2.color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: GlobalText(
              str: context.loc.save_amount(89),
              color: KColor.white.color,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
