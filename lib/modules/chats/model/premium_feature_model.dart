import 'package:flutter/material.dart';

class PremiumFeatureModel {
  final String title;
  final String subTitle;
  final String icon;
  final String? promptId;
  final String? customPrompt;
  final String? aiType;
  final Color? iconColor;

  const PremiumFeatureModel({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.promptId,
    required this.customPrompt,
    required this.aiType,
    this.iconColor,
  });
}
