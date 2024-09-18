import 'package:chat_on/constant/constant_key.dart';
import 'package:chat_on/data_provider/pref_helper.dart';
import 'package:chat_on/modules/splash/controller/state/splash_state.dart';
import 'package:chat_on/utils/app_routes.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/splash_interface.dart';
import '../repository/splash_repository.dart';

final splashController =
    StateNotifierProvider.autoDispose<SplashController, SplashState>(
        (ref) => SplashController());

class SplashController extends StateNotifier<SplashState> {
  final ISplashRepository _splashRepository = SplashRepository();

  SplashController()
      : super(
          const SplashState(
            animationController: null,
          ),
        );

  void setAnimationController(AnimationController animationController) {
    state = state.copyWith(animationController: animationController);
  }

  void startAnimation() {
    if (state.animationController != null) {
      state.animationController!.repeat();
    }
  }

  void stopAnimation() {
    if (state.animationController != null) {
      state.animationController!.dispose();
    }
  }

  checkLoginStatus(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      state.animationController?.dispose();
      final String token = PrefHelper.getString(AppConstant.TOKEN.key);
      if (token.trim().isEmpty) {
        Navigation.pushReplacement(
          context,
          appRoutes: AppRoutes.signIn,
        );
      } else {
        Navigation.pushReplacement(
          context,
          appRoutes: AppRoutes.dashboard,
        );
      }
    });
  }
}
