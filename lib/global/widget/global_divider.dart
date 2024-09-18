import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/styles/k_colors.dart';

class GlobalDivider extends StatelessWidget {
  const GlobalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15.h,
      ),
      width: context.width,
      height: 0.2.h,
      color: KColor.greyText.color,
    );
  }
}
