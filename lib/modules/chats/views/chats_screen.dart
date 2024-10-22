import 'package:chat_on/modules/chats/controller/chats_controller.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/widget/home_type_question_component.dart';
import '../../../global/widget/try_on_premium.dart';
import '../../../utils/styles/k_colors.dart';
import 'components/get_help/get_help_with_task.dart';
import 'components/premium_features/chats_premium_features.dart';
import 'components/receive_quick_answers/receive_quick_answers.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(chatsController.notifier);
    Future(() {
      controller.callApis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      backgroundColor: KColor.gradient2.color,
      body: Container(
        height: context.height,
        width: context.width,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TryOnPremium(),
              const ChatPremiumFeatures(),
              const GetHelpWithTask(),
              const ReceiveQuickAnswers(),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
     bottomNavigationBar: const HomeTypeQuestionComponent(),
    );
  }
}
