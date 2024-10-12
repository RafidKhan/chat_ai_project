import 'dart:io';

import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constant/constant_key.dart';
import '../../../../data_provider/pref_helper.dart';
import '../../../../global/widget/global_text.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/styles/k_colors.dart';
import '../../../chat_thread/controller/chat_thread_controller.dart';
import '../../../chat_thread/model/chat_thread_nav_model.dart';

class CustomBottomSheet{
  static Future<void> setImageToTextPrompt(String id)async {
    await PrefHelper.setString(AppConstant.IMAGE_TO_TEXT_KEY.key,id);
  }
  static void pickFiles(BuildContext context){

  }
 static Future<void> setSpeechTextPrompt(String id)async {
   await PrefHelper.setString(AppConstant.IMAGE_TO_TEXT_KEY.key,id);
 }
 static Future<void> setChatPrompt(String id)async {
   await PrefHelper.setString(AppConstant.CHAT.key,id);
 }
}