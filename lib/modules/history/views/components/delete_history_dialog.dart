import 'package:chat_on/global/widget/global_button.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/history/model/history_item_model.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/history_controller.dart';

class DeleteHistoryDialog extends StatelessWidget {
  final HistoryItemModel itemModel;
  final String historyId;
  final int index;

  const DeleteHistoryDialog({
    super.key,
    required this.itemModel,
    required this.historyId,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: KColor.gradient2.color,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.delete_outline,
            color: KColor.red.color,
          ),
          SizedBox(
            height: 30.h,
          ),
          GlobalText(
            str: context.loc.delete_chat,
            color: KColor.white.color,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 10.h,
          ),
          GlobalText(
            str: context.loc.this_action_cannot_be_undone,
            color: KColor.greyText.color,
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: context.width / 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: GlobalButton(
                      buttonText: context.loc.no,
                      btnBackgroundActiveColor: KColor.secondary.color,
                      onPressed: () {
                        Navigation.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: GlobalButton(
                      buttonText: context.loc.yes,
                      btnBackgroundActiveColor: KColor.red.color,
                      onPressed: () async{
                        Navigation.pop(context);
                        final controller = context.read(historyController.notifier);
                        await controller.deleteHistoryById(historyId,index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
