import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/modules/chats/views/chats_screen.dart';
import 'package:chat_on/utils/app_routes.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../creative_ai/view/creative_ai_screen.dart';
import '/global/widget/global_appbar.dart';
import '../../../global/widget/global_attempt_available.dart';
import '../../../utils/styles/k_assets.dart';
import '../../../utils/styles/k_colors.dart';
import '../../history/views/history_screen.dart';
import '../controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      ChatsScreen(),
      CreativeAiScreen(),
      //TasksForAiScreen(),
      HistoryScreen(),
    ];

    List<String> title = [
      context.loc.chats,
      context.loc.creative_ai,
      //context.loc.ai_task,
      context.loc.history,
    ];


    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(dashboardController);
      final controller = ref.read(dashboardController.notifier);
      final iconHeight = 20.h;
      final iconWidth = 20.w;
      return Scaffold(
        backgroundColor: KColor.gradient2.color,
        appBar: GlobalAppBar(
          title: title[state.selectedIndex],
          actions: [
            const GlobalAttemptAvailable(),
            SizedBox(
              width: 10.w,
            ),
            InkWell(
              onTap: () {
                Navigation.push(
                  context,
                  appRoutes: AppRoutes.settings,
                );
              },
              child: GlobalImageLoader(
                imagePath: KAssetName.icGearPng.imagePath,
                height: 20.h,
                width: 20.w,
                color: KColor.white.color,
              ),
            ),
            SizedBox(
              width: 20.w,
            )
          ],
        ),
        body: screens[state.selectedIndex],
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 0.2.h,
              width: context.width,
              color: KColor.greyText.color,
            ),
            SizedBox(
              height: 10.h,
            ),
            BottomNavigationBar(
                enableFeedback: false,
                backgroundColor: KColor.gradient2.color,
                type: BottomNavigationBarType.fixed,
                fixedColor: KColor.accent2.color,
                unselectedItemColor: KColor.greyText.color,
                selectedLabelStyle: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.8.h,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.8.h,
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: GlobalImageLoader(
                      imagePath: KAssetName.travelAiWhitePng.imagePath,
                      height: iconHeight,
                      width: iconWidth,
                      color: state.selectedIndex == 0
                          ? KColor.accent2.color
                          : KColor.greyText.color,
                    ),
                    label: context.loc.travel_ai,
                  ),
                  BottomNavigationBarItem(
                    icon: GlobalImageLoader(
                      imagePath: KAssetName.aiTaskWhitePng.imagePath,
                      height: iconHeight,
                      width: iconWidth,
                      color: state.selectedIndex == 1
                          ? KColor.accent2.color
                          : KColor.greyText.color,
                    ),
                    label: context.loc.creative_ai,
                  ),
                  // BottomNavigationBarItem(
                  //   icon: GlobalImageLoader(
                  //     imagePath: KAssetName.creativeAiWhitePng.imagePath,
                  //     height: iconHeight,
                  //     width: iconWidth,
                  //     color: state.selectedIndex == 2
                  //         ? KColor.accent2.color
                  //         : KColor.greyText.color,
                  //   ),
                  //   label: context.loc.ai_task,
                  // ),
                  BottomNavigationBarItem(
                    icon: GlobalImageLoader(
                      imagePath: KAssetName.icHistoryPng.imagePath,
                      height: iconHeight,
                      width: iconWidth,
                      color: state.selectedIndex == 3
                          ? KColor.accent2.color
                          : KColor.greyText.color,
                    ),
                    label: context.loc.history,
                  ),
                  // BottomNavigationBarItem(
                  //   icon: GlobalImageLoader(
                  //     imagePath: KAssetName.aiTaskWhitePng.imagePath,
                  //     height: iconHeight,
                  //     width: iconWidth,
                  //     color: state.selectedIndex == 4
                  //         ? KColor.accent2.color
                  //         : KColor.greyText.color,
                  //   ),
                  //   label: context.loc.ai_task,
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: GlobalImageLoader(
                  //     imagePath: KAssetName.creativeAiWhitePng.imagePath,
                  //     height: iconHeight,
                  //     width: iconWidth,
                  //     color: state.selectedIndex == 5
                  //         ? KColor.accent2.color
                  //         : KColor.greyText.color,
                  //   ),
                  //   label: context.loc.creative_ai,
                  // ),
                ],
                currentIndex: state.selectedIndex,
                onTap: (index) {
                  controller.setIndex(index);
                }),
          ],
        ),
      );
    });
  }
}
