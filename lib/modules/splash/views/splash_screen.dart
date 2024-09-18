import 'package:chat_on/modules/splash/controller/splash_controller.dart';
import 'package:chat_on/modules/splash/views/components/splash_info.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';

import 'components/moving_spash_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      final controller = context.read(splashController.notifier);
      Future(() {
        controller.checkLoginStatus(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.gradient2.color,
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: const Stack(
          alignment: Alignment.bottomCenter,
          children: [
            MovingSplashLogo(),
            SplashInfo(),
          ],
        ),
      ),
    );
  }
}
