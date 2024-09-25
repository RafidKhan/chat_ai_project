import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_routes.dart';
import '../../../../utils/navigation.dart';
import '../../../chat_thread/model/chat_thread_nav_model.dart';
import '../../model/history_item_model.dart';

class HistoryItem extends StatelessWidget {
  final HistoryItemModel itemModel;
  final VoidCallback onMenuTap;

  const HistoryItem({
    super.key,
    required this.itemModel,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final model = ChatThreadNavModel(promptId: itemModel.promptId, customPrompt: itemModel.title,promptResponse: itemModel.promptResponse);
        Navigation.push(
          context,
          appRoutes: AppRoutes.chatThread,
          arguments: model
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 20.h,
        ),
        width: context.width,
        decoration: BoxDecoration(
          //color: KColor.secondary.color,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              KColor.gradient1.color,
              KColor.gradient2.color,
            ],
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GlobalText(
                    str: itemModel.title,
                    color: KColor.white.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                InkWell(
                  onTap: onMenuTap,
                  child: Icon(
                    Icons.more_vert,
                    color: KColor.white.color,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            GlobalText(
              str: itemModel.dateTime,
              color: KColor.greyText.color,
            ),
          ],
        ),
      ),
    );
  }
}
