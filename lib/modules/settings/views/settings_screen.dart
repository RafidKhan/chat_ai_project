import 'package:chat_on/modules/settings/views/components/settings_part_2.dart';
import 'package:chat_on/modules/settings/views/components/settings_social_media.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'components/settings_part_3.dart';
import 'components/what_is_new.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.gradient2.color,
      appBar: GlobalAppBar(
        title: context.loc.settings,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WhatIsNew(),
              SizedBox(
                height: 20.h,
              ),
              const SettingsPart2(),
              SizedBox(
                height: 20.h,
              ),
              const SettingsPart3(),
              SizedBox(
                height: 20.h,
              ),
              GlobalText(
                str: context.loc.follow_us,
                color: KColor.white.color,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 10.h,
              ),
              const SettingSocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
