import 'package:flutter/material.dart';

class GetHelpModel {
  final String? promptId;
  final String? customPrompt;
  final String title;
  final String subTitle;
  final String icon;
  final Color? iconColor;
  final String? aiType;

  const GetHelpModel({
    required this.promptId,
    required this.customPrompt,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.iconColor,
    this.aiType
  });
}
