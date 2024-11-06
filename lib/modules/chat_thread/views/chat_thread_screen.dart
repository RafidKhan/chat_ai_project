import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/modules/chat_thread/controller/chat_thread_controller.dart';
import 'package:chat_on/modules/chat_thread/model/chat_thread_nav_model.dart';
import 'package:chat_on/modules/chat_thread/views/components/chat_thread_bottom_section.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/global/widget/global_appbar.dart';
import 'components/chat_threads_section.dart';
import 'components/thread_type_section.dart';

class ChatThreadScreen extends StatefulWidget {
  final ChatThreadNavModel model;

  const ChatThreadScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ChatThreadScreen> createState() => _ChatThreadScreenState();
}

class _ChatThreadScreenState extends State<ChatThreadScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(chatThreadController.notifier);
    Future(() {
      controller.setPromptId(widget.model.promptId);
      if(widget.model.promptResponse != null){
        controller.loadHistory(promptId: widget.model.promptId,response: widget.model.promptResponse,message: widget.model.customPrompt);
      }else if(widget.model.imageFile != null && widget.model.aiType == "FILES"){
        controller.setImageFile(widget.model.imageFile!);
        controller.uploadImage(context,aiType: "FILES", onSuccessFunction: (response){});
      }else if(widget.model.url != null && widget.model.aiType == "YOUTUBE_LINK"){
        controller.sendYoutubeUrl(context,url: widget.model.url);
      }else{
        controller.setDefaultPrompt(widget.model.customPrompt);
        if (widget.model.imageFile != null) {
          controller.setImageFile(widget.model.imageFile!);
          controller.uploadImage(context,aiType: "", onSuccessFunction: (response){});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(chatThreadController.notifier);
    return Scaffold(
      backgroundColor: KColor.gradient2.color,
      appBar: GlobalAppBar(
        title: context.loc.chat,
        actions: [
          // Padding(
          //   padding: EdgeInsets.all(16.r),
          //   child: InkWell(
          //     onTap: () {},
          //     child: GlobalImageLoader(
          //       imagePath: KAssetName.filterPng.imagePath,
          //       color: KColor.white.color,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.all(16.r),
          //   child: InkWell(
          //     onTap: () {
          //       controller.requestFocus();
          //     },
          //     child: GlobalImageLoader(
          //       imagePath: KAssetName.editPng.imagePath,
          //       color: KColor.white.color,
          //     ),
          //   ),
          // ),
        ],
      ),
      body: const Column(
        children: [
          ThreadTypeSection(),
          ChatThreadsSection(),
        ],
      ),
      bottomNavigationBar: const ChatThreadBottomSection(),
    );
  }
}
