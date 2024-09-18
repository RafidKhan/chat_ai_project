import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/styles/k_colors.dart';

class GetProAccessGradient extends StatelessWidget {
  final Widget child;

  const GetProAccessGradient({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            KColor.transparent.color,
            KColor.gradient2.color.withOpacity(0.5),
            KColor.gradient2.color,
            KColor.gradient2.color,
            KColor.gradient2.color,
            KColor.gradient2.color,
            KColor.gradient2.color,
          ],
        ),
      ),
      child: child,
    );
  }
}
