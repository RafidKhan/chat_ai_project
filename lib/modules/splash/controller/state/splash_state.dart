import 'package:flutter/material.dart';

@immutable
class SplashState {
  final AnimationController? animationController;

  const SplashState({
    required this.animationController,
  });

  SplashState copyWith({AnimationController? animationController}) {
    return SplashState(
      animationController: animationController ?? this.animationController,
    );
  }
}
