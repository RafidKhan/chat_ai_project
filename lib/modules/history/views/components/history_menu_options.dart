import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/modules/history/model/history_item_model.dart';
import 'package:chat_on/modules/history/views/components/history_item_rename.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'delete_history_dialog.dart';

class HistoryMenuOptions extends StatelessWidget {
  final HistoryItemModel itemModel;

  const HistoryMenuOptions({
    super.key,
    required this.itemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: KColor.secondary.color,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MenuOption(
            title: context.loc.rename,
            icon: Icons.edit,
            color: KColor.white.color,
            onTap: () {
              Navigation.pop(context);
              Future.delayed(const Duration(milliseconds: 200), () {
                ViewUtil.bottomSheet(
                  context: context,
                  content: HistoryItemRename(
                    itemModel: itemModel,
                  ),
                );
              });
            },
          ),
          Container(
            width: context.width,
            height: 0.2.h,
            color: KColor.white.color,
            margin: EdgeInsets.symmetric(
              vertical: 5.h,
            ),
          ),
          MenuOption(
            title: context.loc.delete,
            icon: Icons.delete,
            color: KColor.red.color,
            onTap: () {
              Navigation.pop(context);
              Future.delayed(const Duration(milliseconds: 200), () {
                ViewUtil.showAlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: DeleteHistoryDialog(
                    itemModel: itemModel,
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const MenuOption({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: GlobalText(
              str: title,
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              maxLines: 1,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
