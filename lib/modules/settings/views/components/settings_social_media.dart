import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/settings/model/settings_social_media_model.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingSocialMedia extends StatelessWidget {
  const SettingSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SettingsSocialMediaModel> items = [
      SettingsSocialMediaModel(
        title: context.loc.facebook,
        url: "https://www.facebook.com/chatibotai",
        icon: KAssetName.facebookPng.imagePath,
      ),
      SettingsSocialMediaModel(
        title: context.loc.instagram,
        url: "https://www.instagram.com/chat_ibot_ai",
        icon: KAssetName.instagramWhitePng.imagePath,
      ),
      // SettingsSocialMediaModel(
      //   title: context.loc.tiktok,
      //   url: "https://www.tiktok.com/explore",
      //   icon: KAssetName.tiktokWhitePng.imagePath,
      // ),
      SettingsSocialMediaModel(
        title: context.loc.linkedin,
        url: "https://www.linkedin.com/company/chat-ibot-ai",
        icon: KAssetName.linkedinWhitePng.imagePath,
      ),
      SettingsSocialMediaModel(
        title: context.loc.youtube,
        url: "https://www.youtube.com/@ResortsOm",
        icon: KAssetName.youtubeWhitePng.imagePath,
      ),
    ];
    return SizedBox(
      height: 100.h,
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((e) {
          return InkWell(
            onTap: () async{
              if (!await launchUrl(Uri.parse(e.url))) {
              throw Exception('Could not launch');
              }
            },
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: KColor.greyText.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color: KColor.white.color,
                      ),
                    ),
                    child: GlobalImageLoader(
                      imagePath: e.icon,
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GlobalText(
                    str: e.title,
                    color: KColor.greyText.color,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
