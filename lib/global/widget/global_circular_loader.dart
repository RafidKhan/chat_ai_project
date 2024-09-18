import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GlobalCircularLoader extends StatelessWidget {
  const GlobalCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: SpinKitThreeBounce(
          color: KColor.accent.color,
          size: 30.r,
        ),
      ),
    );
  }
}
