import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalRadio extends StatelessWidget {
  final bool isSelected;

  const GlobalRadio({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
        color: KColor.white.color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: 16.h,
          width: 16.w,
          decoration: BoxDecoration(
            color: KColor.gradient2.color,
            shape: BoxShape.circle,
          ),
          child: isSelected
              ? Center(
                  child: Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: KColor.white.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
