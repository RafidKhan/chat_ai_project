import 'package:chat_on/data_provider/pref_helper.dart';
import 'package:chat_on/global/widget/global_divider.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/app_routes.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/launch_url.dart';

class SettingsPart3 extends StatelessWidget {
  const SettingsPart3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        color: KColor.secondary.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async{
              if (!await launchUrl(Uri.parse("https://www.google.com/"))) {
                throw Exception('Could not launch');
              }
            },
            child: GlobalText(
              str: context.loc.manage_subscription,
              color: KColor.white.color,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const GlobalDivider(),
          InkWell(
            onTap: () async{
              if (!await launchUrl(Uri.parse("https://www.google.com/"))) {
                throw Exception('Could not launch');
              }
            },
            child: GlobalText(
              str: context.loc.terms_of_use,
              color: KColor.white.color,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const GlobalDivider(),
          InkWell(
            onTap: () async{
              if (!await launchUrl(Uri.parse("https://www.google.com/"))) {
                throw Exception('Could not launch');
              }
            },
            child: GlobalText(
              str: context.loc.privacy_policy,
              color: KColor.white.color,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const GlobalDivider(),
          InkWell(
            onTap: () async{
              if (!await launchUrl(Uri.parse("https://www.google.com/"))) {
                throw Exception('Could not launch');
              }
            },
            child: GlobalText(
              str: context.loc.contact_us,
              color: KColor.white.color,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const GlobalDivider(),
          InkWell(
            onTap: () async{
              if (!await launchUrl(Uri.parse("https://www.google.com/"))) {
                throw Exception('Could not launch');
              }
            },
            child: GlobalText(
              str: context.loc.rate_us,
              color: KColor.white.color,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const GlobalDivider(),
          InkWell(
            onTap: () {
              PrefHelper.logout().then(
                (e) {
                  Navigation.pushAndRemoveUntil(
                    context,
                    appRoutes: AppRoutes.signIn,
                  );
                },
              );
            },
            child: Row(
              children: [
                const Icon(Icons.logout),
                SizedBox(
                  width: 10.w,
                ),
                GlobalText(
                  str: context.loc.logout,
                  color: KColor.white.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
