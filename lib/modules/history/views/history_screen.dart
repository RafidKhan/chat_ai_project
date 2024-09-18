import 'package:chat_on/global/widget/try_on_premium.dart';
import 'package:chat_on/modules/history/model/history_item_model.dart';
import 'package:chat_on/modules/history/views/components/history_item.dart';
import 'package:chat_on/modules/history/views/components/history_menu_options.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/history_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  void initState() {
    super.initState();
    Future(() {
      final controller = context.read(historyController.notifier);
      controller.getAllHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TryOnPremium(),
            SizedBox(
              height: 30.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 30,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemBuilder: (context, index) {
                const model = HistoryItemModel(
                  title: "How many hours of sleep does a man need for proper rest?",
                  dateTime: "19.04.2024 22:21",
                );
                return HistoryItem(
                  itemModel: model,
                  onMenuTap: () {
                    ViewUtil.bottomSheet(
                      context: context,
                      content: const HistoryMenuOptions(
                        itemModel: model,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
