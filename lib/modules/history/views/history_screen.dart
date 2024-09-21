import 'package:chat_on/global/widget/try_on_premium.dart';
import 'package:chat_on/modules/history/model/history_item_model.dart';
import 'package:chat_on/modules/history/views/components/history_item.dart';
import 'package:chat_on/modules/history/views/components/history_menu_options.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../global/widget/global_circular_loader.dart';
import '../../../global/widget/global_no_data.dart';
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
    final controller = context.read(historyController.notifier);
    Future(() {
      controller.getAllHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child){
      final state = ref.watch(historyController);
      if (state.isLoading!) {
        return const GlobalCircularLoader();
      }
      if (state.getAllHistoryResponse?.data == null) {
        return const GlobalNoData();
      }
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
                itemCount: state.getAllHistoryResponse!.data!.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemBuilder: (context, index) {
                  var item = state.getAllHistoryResponse!.data![index];
                   final model = HistoryItemModel(
                    title: item.request!,
                    dateTime: DateFormat("dd-MMM-yyyy").format(item.createdAt!),
                  );
                  return HistoryItem(
                    itemModel: model,
                    onMenuTap: () {
                      ViewUtil.bottomSheet(
                        context: context,
                        content: HistoryMenuOptions(
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
    );
  }
}
