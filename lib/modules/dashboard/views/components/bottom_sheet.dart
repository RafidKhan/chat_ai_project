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
 static void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: KColor.gradient2.color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
            ),
            border: Border.all(color: KColor.white.color)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async{
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(source: ImageSource.camera);
                    if(image != null){
                      Navigator.pop(context);
                      final imageToTextPromptId =  await PrefHelper.getString(AppConstant.IMAGE_TO_TEXT_KEY.key);
                      File file = File(image.path);
                      Navigation.push(
                        context,
                        appRoutes: AppRoutes.chatThread,
                        arguments: ChatThreadNavModel(
                          promptId: imageToTextPromptId,
                          customPrompt: null,
                          imageFile: file,
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.camera),
                      const SizedBox(
                        width: 15,
                      ),
                      GlobalText(
                        str: "Take using camera",
                        color: KColor.white.color,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async{
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                    if(image != null){
                      Navigator.pop(context);
                      File file = File(image.path);
                      Navigation.push(
                        context,
                        appRoutes: AppRoutes.chatThread,
                        arguments: ChatThreadNavModel(
                          promptId: null,
                          customPrompt: null,
                          imageFile: file,
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      SizedBox(
                        width: 15,
                      ),
                      GlobalText(
                        str: "Select from gallery",
                        color: KColor.white.color,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  static Future<void> setImageToTextPrompt(String id)async {
    await PrefHelper.setString(AppConstant.IMAGE_TO_TEXT_KEY.key,id);
  }
 static Future<void> setSpeechTextPrompt(String id)async {
   await PrefHelper.setString(AppConstant.IMAGE_TO_TEXT_KEY.key,id);
 }
}