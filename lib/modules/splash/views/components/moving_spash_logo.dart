import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/modules/splash/controller/splash_controller.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/styles/k_assets.dart';

class MovingSplashLogo extends StatefulWidget {
  const MovingSplashLogo({super.key});

  @override
  State<MovingSplashLogo> createState() => _MovingSplashLogoState();
}

class _MovingSplashLogoState extends State<MovingSplashLogo>
    with SingleTickerProviderStateMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   final controller = context.read(splashController.notifier);
  //   Future(() {
  //     final animationController = AnimationController(
  //       vsync: this,
  //       duration: const Duration(milliseconds: 2000),
  //     );
  //     controller.setAnimationController(animationController);
  //     controller.startAnimation();
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   final controller = context.read(splashController.notifier);
  //   controller.stopAnimation();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(splashController);
      // if (state.animationController == null) {
      //   return const SizedBox.shrink();
      // }
      return Center(
        child: SizedBox(
          height: 150.h,
          width: 150.w,
          child: GlobalImageLoader(
            imagePath: KAssetName.appLogoPng.imagePath,
          ),
        ),
        // child: RotationTransition(
        //   turns: state.animationController!,
        //   child: SizedBox(
        //     height: 150.h,
        //     width: 150.w,
        //     child: GlobalImageLoader(
        //       imagePath: KAssetName.appLogoPng.imagePath,
        //     ),
        //   ),
        // ),
      );
    });
  }
}
