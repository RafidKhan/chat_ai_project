import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_on/constant/constant_key.dart';
import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/modules/chat_thread/model/chat_thread_model.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/mixin/global_mixin.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:vibration/vibration.dart';

import '../../../../global/widget/global_text.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/navigation.dart';
import '../../controller/chat_thread_controller.dart';
import 'image_full_screen_view.dart';

class ChatThreadsSection extends StatelessWidget with GlobalMixin {
  const ChatThreadsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(chatThreadController);
        final controller = ref.read(chatThreadController.notifier);
        final threads = state.threads.reversed.toList();
        if (threads.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              itemCount: threads.length,
              reverse: true,
              itemBuilder: (context, index) {
                final chat = threads[index];
                return ChatBubble(
                  isAnimate: index == 0,
                  model: chat,
                  onTapCopy: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: chat.prompt,
                      ),
                    );
                  },
                  onTapShare: () async{
                    await FlutterShare.share(
                        title: 'Share',
                        text: chat.prompt,
                    );
                  },
                  onTapReask: () {
                    controller.reAsk(
                      context,
                      chat: chat,
                    );
                  },
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class ChatBubble extends StatelessWidget {
  final ChatThreadModel model;
  final VoidCallback? onTapCopy;
  final VoidCallback? onTapShare;
  final VoidCallback? onTapReask;
  final bool isAnimate;

  const ChatBubble({
    super.key,
    required this.model,
    this.onTapCopy,
    this.onTapShare,
    this.onTapReask,
    required this.isAnimate,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMe = model.userType == ChatUserType.USER_ME;
    String promptText = "";
    String? imageUrl = model.imageUrl;

    if (model.prompt.contains(AppConstant.IMAGE_URL_IS.key)) {
      promptText = model.prompt.split(AppConstant.IMAGE_URL_IS.key).first;
    } else {
      promptText = model.prompt;
    }

    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      return Container(
        //alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 10.w,
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            minWidth: 50,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          decoration: BoxDecoration(
            color: isMe ? KColor.accent2.color : KColor.greyText.color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
             !isMe && isAnimate
                  ? AnimatedTextKit(
                     isRepeatingAnimation: false,
                      repeatForever: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          promptText,
                          textStyle: TextStyle(
                            color: KColor.black.color,
                              fontSize: 16.0,
                              fontFamily: AppConstant.FONTFAMILY.key,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  : GlobalText(
                      str: promptText,
                      color: isMe ? KColor.white.color : KColor.black.color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              if (imageUrl != null) ...[
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageFullScreenView(imageUrl: imageUrl)),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: GlobalImageLoader(
                      imagePath: imageUrl,
                      imageFor: ImageFor.network,
                      height: 120.h,
                      width: context.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(model.imageUrl == null)
                  ChipWidget(
                    text: context.loc.copy,
                    icon: Icons.copy,
                    onTap: onTapCopy,
                  ),
                  // ChipWidget(
                  //   text: context.loc.share,
                  //   icon: Icons.share,
                  //   onTap: onTapShare,
                  // ),
                  ChipWidget(
                    text: context.loc.share,
                    icon: Icons.share,
                    onTap: onTapShare,
                  ),
                  if (isMe)
                    ChipWidget(
                      text: context.loc.re_ask,
                      icon: Icons.replay,
                      onTap: onTapReask,
                    ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class ChipWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  const ChipWidget({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null
          ? null
          : () async {
              final bool hasVibration =
                  (await Vibration.hasVibrator()) ?? false;
              if (hasVibration) {
                Vibration.vibrate();
              }

              onTap!();
            },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 4.h,
        ),
        decoration: BoxDecoration(
          color: KColor.gradient2.color.withOpacity(0.5),
          borderRadius: BorderRadius.circular(6.r),
        ),
        margin: EdgeInsets.only(
          right: 5.w,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 15.w,
            ),
            SizedBox(
              width: 3.w,
            ),
            GlobalText(
              str: text,
            ),
          ],
        ),
      ),
    );
  }
}
