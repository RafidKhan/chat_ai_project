import 'package:chat_on/global/widget/global_button.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/history_item_model.dart';

class HistoryItemRename extends StatefulWidget {
  final HistoryItemModel itemModel;

  const HistoryItemRename({super.key, required this.itemModel});

  @override
  State<HistoryItemRename> createState() => _HistoryItemRenameState();
}

class _HistoryItemRenameState extends State<HistoryItemRename> {
  final TextEditingController textEditingController = TextEditingController();

  final ValueNotifier<bool> isEnabled = ValueNotifier(false);

  void setData() {
    textEditingController.text = widget.itemModel.title;
    checkButtonStatus();
  }

  checkButtonStatus() {
    isEnabled.value = textEditingController.text.trim().isNotEmpty;
  }

  clearText() {
    textEditingController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
    textEditingController.addListener(() {
      checkButtonStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: context.width,
        color: KColor.secondary.color,
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 20.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: GlobalText(
                    str: context.loc.rename_the_chat,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: KColor.white.color,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigation.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: KColor.greyText.color,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: KColor.greyText.color,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      style: TextStyle(
                        color: KColor.white.color,
                      ),
                      decoration: InputDecoration(
                        hintText: context.loc.type_the_new_name_here,
                        hintStyle: TextStyle(
                          color: KColor.greyText.color,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  if (textEditingController.text.trim().isNotEmpty) ...[
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      onTap: () {
                        clearText();
                      },
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: KColor.greyText.color,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.close,
                            size: 15.r,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ValueListenableBuilder(
                valueListenable: isEnabled,
                builder: (context, data, child) {
                  return GlobalButton(
                    onPressed: isEnabled.value ? () {} : null,
                    buttonText: context.loc.continue_text,
                    //isEnabled: isEnabled.value,
                  );
                })
          ],
        ),
      ),
    );
  }
}
