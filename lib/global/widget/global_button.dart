import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_on/global/widget/global_text.dart';

import '../../utils/styles/styles.dart';

class GlobalButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool isRounded;
  final double? btnHeight;
  final int? roundedBorderRadius;
  final Color? btnBackgroundActiveColor;
  final double? textFontSize;
  final Color? textColor;
  final FontWeight? fontWeight;

  const GlobalButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.isRounded = true,
    this.btnHeight,
    this.roundedBorderRadius,
    this.btnBackgroundActiveColor,
    this.textFontSize,
    this.textColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color btnColor = btnBackgroundActiveColor ?? KColor.accent2.color;

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (states) {
            return RoundedRectangleBorder(
              borderRadius: isRounded
                  ? BorderRadius.circular(
                (roundedBorderRadius ?? 4).r,
              )
                  : BorderRadius.zero,
            );
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) =>
          onPressed != null ? btnColor : KColor.grey.color,
        ),
        elevation: MaterialStateProperty.resolveWith(
              (states) => 0.0,
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: btnHeight ?? 50.h,
        child: Center(
          child: GlobalText(
            str: buttonText,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: textFontSize ?? 16,
            color: textColor ?? KColor.white.color,
          ),
        ),
      ),
    );
  }
}
