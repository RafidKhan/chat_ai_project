import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global_text.dart';

class GlobalGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Color? activeButtonColor;
  final Color? inactiveButtonColor;

  const GlobalGradientButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isEnabled = true,
    this.activeButtonColor,
    this.inactiveButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              KColor.accent.color,
              KColor.secondary.color,
            ],
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.centerLeft, child: SizedBox()),
            Align(
              alignment: Alignment.center,
              child: GlobalText(
                str: buttonText,
                color: isEnabled ? KColor.white.color : KColor.greyText.color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: KColor.white.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
