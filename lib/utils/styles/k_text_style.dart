import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'styles.dart';

class KTextStyle {
  static TextStyle customTextStyle(
          {double fontSize = 12, fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        //color: KColor.fromText.color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      );
  static TextStyle customHintTextStyle(
      {double fontSize = 12, fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      );
}
