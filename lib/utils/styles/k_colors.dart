import 'package:flutter/material.dart';

enum KColor {
  secondary,
  accent,
  accent2,
  red,
  white,
  black,
  grey,
  divider,
  fill,
  transparent,
  enableBorder,
  fromText,
  statusBar,
  addbtn,
  formtextFill,
  dashBack,
  drawerHeader,
  dropDownfill,
  bookingText,
  greyText,
  greyText2,
  gradient1,
  gradient2,
}

extension KColorExtention on KColor {
  Color get color {
    switch (this) {
      case KColor.secondary:
        //return Color(0xff1b1c1e);
        //return Color(0xff474F7A);
        return const Color(0xff000000);
      case KColor.accent:
        //return Color(0xff14bb87);
        //return Color(0xff81689D);
        return const Color(0xff055AFF);
      case KColor.accent2:
        //return Color(0xff089561);
        //return const Color(0xffff4db8);
        return const Color(0xff58B1EA);
      case KColor.red:
        return const Color(0xfffb5640);
      case KColor.grey:
        return const Color.fromARGB(255, 157, 157, 157);
      case KColor.addbtn:
        return const Color(0xFFA8CFFF);
      case KColor.black:
        return Colors.black;
      case KColor.divider:
        return const Color(0xffE6E6E6);
      case KColor.enableBorder:
        return const Color(0xffE0E0E0);
      case KColor.fill:
        return const Color.fromARGB(255, 247, 246, 246);
      case KColor.fromText:
        return const Color(0xff7B7A7A);
      case KColor.white:
        return Colors.white;
      case KColor.statusBar:
        return const Color(0xff3E95FF);
      case KColor.transparent:
        return Colors.transparent;
      case KColor.formtextFill:
        return const Color(0xffFCFCFC);
      case KColor.drawerHeader:
        return const Color(0xFF5EA7FF);
      case KColor.dropDownfill:
        return const Color(0xFFFCFCFC);
      case KColor.dashBack:
        return const Color(0xffF8F8F8);
      case KColor.bookingText:
        return const Color(0xff808080);
      case KColor.greyText:
        return const Color(0xffb4b5b9);
      case KColor.greyText2:
        return const Color(0xffd6faf6);
      case KColor.gradient1:
        return const Color(0xff060D13);
      case KColor.gradient2:
        return const Color(0xff042636);
    }
  }
}
