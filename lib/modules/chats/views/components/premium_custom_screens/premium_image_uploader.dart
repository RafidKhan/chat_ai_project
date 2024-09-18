import 'dart:io';

import 'package:chat_on/global/widget/global_appbar.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/navigation.dart';

class PremiumImageUploader extends StatelessWidget {
  final Function(File file) onImageSelect;

  const PremiumImageUploader({
    super.key,
    required this.onImageSelect,
  });

  @override
  Widget build(BuildContext context) {
    final List<KeyValueModel> keyValueModels = [
      const KeyValueModel(
        key: "Custom request",
        value: "Give your own task to the bot",
      ),
      const KeyValueModel(
        key: "Description",
        value: "Discover what's shown in a picture",
      ),
      const KeyValueModel(
        key: "UI-to-code",
        value: "Turn UI text into code",
      ),
      const KeyValueModel(
        key: "Hashtags",
        value: "Generate perfect hashtags for a photo",
      ),
      const KeyValueModel(
        key: "Captions",
        value: "Create catchy captions for your visual",
      ),
      const KeyValueModel(
        key: "Interior design",
        value: "Improve the style of your visual",
      ),
      const KeyValueModel(
        key: "Cooking inspiration",
        value: "Get a recipe for a dish in a photo",
      ),
    ];
    return SizedBox(
      height: context.height - 20.h,
      child: Scaffold(
        backgroundColor: KColor.gradient2.color,
        appBar: const GlobalAppBar(
          title: "Choose Your Next Step",
        ),
        body: ListView.builder(
          itemCount: keyValueModels.length,
          itemBuilder: (context, index) {
            final data = keyValueModels[index];
            return ListTile(
              onTap: () {
                ViewUtil.bottomSheet(
                  context: context,
                  content: ImagePickerType(
                    onSourceSelected: (source) async {
                      await ImagePicker().pickImage(source: source).then(
                        (xFile) {
                          if (xFile != null) {
                            final file = File(xFile.path);
                            onImageSelect(file);
                            Navigation.pop(context);
                          }
                        },
                      );
                    },
                  ),
                );
              },
              leading: Icon(
                Icons.photo_camera_back,
                color: KColor.white.color,
              ),
              title: GlobalText(
                str: data.key,
                fontWeight: FontWeight.w700,
              ),
              subtitle: GlobalText(
                str: data.value,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: KColor.greyText.color,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ImagePickerType extends StatelessWidget {
  final Function(ImageSource source) onSourceSelected;

  const ImagePickerType({
    super.key,
    required this.onSourceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 16.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            onTap: () {
              onSourceSelected(ImageSource.camera);
              Navigation.pop(context);
            },
            child: GlobalText(
              str: "Camera",
              color: KColor.black.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              onSourceSelected(ImageSource.gallery);
              Navigation.pop(context);
            },
            child: GlobalText(
              str: "Gallery",
              color: KColor.black.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () => Navigation.pop(context),
            child: GlobalText(
              str: "Cancel",
              color: KColor.black.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class KeyValueModel {
  final String key;
  final String value;

  const KeyValueModel({
    required this.key,
    required this.value,
  });
}
