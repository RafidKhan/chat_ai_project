import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/styles/styles.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  const GlobalAppBar({
    Key? key,
    this.title,
    this.centerTitle,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? KColor.secondary.color,
      iconTheme: IconThemeData(color: KColor.white.color),
      title: GlobalText(
        str: title ?? "",
        color: KColor.white.color,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(56.h);
}
