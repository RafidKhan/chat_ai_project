import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/get_pro_access/views/get_pro_access_screen.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TryOnPremium extends StatelessWidget {
  const TryOnPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ViewUtil.bottomSheet(
          context: context,
          content: const GetProAccessScreen(),
        );
        //Navigation.push(context, appRoutes: AppRoutes.getProAccess);
      },
      // child: Container(
      //   padding: EdgeInsets.only(
      //     right: 20.w,
      //   ),
      //   //height: 120.h,
      //   width: context.width,
      //   decoration: BoxDecoration(
      //     color: KColor.accent2.color,
      //     borderRadius: BorderRadius.circular(16.r),
      //   ),
      //   child: Row(
      //     children: [
      //       GlobalImageLoader(
      //         imagePath: KAssetName.icRobotPng.imagePath,
      //         height: 120.h,
      //         //width: 90.w,
      //       ),
      //       Expanded(
      //         child: Padding(
      //           padding: EdgeInsets.only(
      //             top: 12.h,
      //             bottom: 12.h,
      //           ),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               GlobalText(
      //                 str: context.loc.try_premium,
      //                 fontSize: 18,
      //                 color: KColor.white.color,
      //               ),
      //               GlobalText(
      //                 str: context.loc.tap_to_claim,
      //                 fontSize: 16,
      //                 color: KColor.greyText2.color,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Icon(
      //         Icons.arrow_forward_ios,
      //         color: KColor.white.color,
      //       ),
      //     ],
      //   ),
      // ),
      child: GlobalImageLoader(
        imagePath: KAssetName.getPremiumImagePng.imagePath,
        width: context.width,
        fit: BoxFit.fill,
      ),
    );
  }
}
