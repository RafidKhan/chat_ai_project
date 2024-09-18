import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final String subTitle;
  final String icon;
  bool isFavourite;
  final Color? iconColor;
  final String? promptId;
  final String? prompt;

  TaskModel({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.isFavourite,
    required this.promptId,
    required this.prompt,
    this.iconColor,
  });
}
