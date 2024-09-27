import 'package:chat_on/global/widget/global_divider.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/widget/global_switch.dart';

class SettingsPart2 extends StatelessWidget {
  const SettingsPart2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        color: KColor.secondary.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Expanded(
                  child: GlobalText(
                    str: context.loc.language,
                    color: KColor.white.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GlobalText(
                  str: context.loc.english,
                  color: KColor.white.color,
                  fontSize: 16,
                )
              ],
            ),
          ),
          // const GlobalDivider(),
          // Row(
          //   children: [
          //     Expanded(
          //       child: GlobalText(
          //         str: context.loc.haptic_feedback,
          //         color: KColor.white.color,
          //         fontSize: 16,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //     GlobalSwitch(
          //       value: false,
          //       onToggle: (value) {},
          //     ),
          //   ],
          // ),
          // const GlobalDivider(),
          // Row(
          //   children: [
          //     Expanded(
          //       child: GlobalText(
          //         str: context.loc.follow_up_questions,
          //         color: KColor.white.color,
          //         fontSize: 16,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //     GlobalSwitch(
          //       value: true,
          //       onToggle: (value) {},
          //     ),
          //   ],
          // ),
          // const GlobalDivider(),
          // GlobalText(
          //   str: context.loc.keep_your_chat_going,
          //   color: KColor.greyText.color,
          // ),
        ],
      ),
    );
  }
}
