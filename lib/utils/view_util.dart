import 'package:chat_on/global/widget/global_button.dart';
import 'package:chat_on/global/widget/global_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewUtil {
  static SSLSnackbar(
    String msg, {
    Color? color,
  }) {
    // return ScaffoldMessenger.of(Navigation.key.currentContext!).showSnackBar(
    //   SnackBar(
    //     backgroundColor: color,
    //     content: GlobalText(
    //       str: msg,
    //       fontWeight: FontWeight.w500,
    //       color: KColor.white.color,
    //     ),
    //   ),
    // );
  }

  // this varialble is for internet connection check.
  static bool isPresentedDialog = false;

  static showInternetDialog({
    required VoidCallback onPressed,
  }) async {
    // flutter defined function.
    await showDialog(
      context: Navigation.key.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog.
        return AlertDialog(
          title: const GlobalText(
            str: "Connection Error",
            fontWeight: FontWeight.w500,
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const GlobalText(
                str: "Your internet connection appears to be offline",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 25.h,
              ),
              GlobalButton(
                onPressed: onPressed,
                buttonText: "Try Again",
              )
            ],
          ),
        );
      },
    );
  }

// global alert dialog
  static Future showAlertDialog({
    Widget? title,
    required Widget content,
    List<Widget>? actions,
    Color? alertBackgroundColor,
    bool? barrierDismissible,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? contentPadding,
  }) async {
    // flutter defined function.
    await showDialog(
      context: Navigation.key.currentContext!,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        // return object of type Dialog.
        return AlertDialog(
          backgroundColor: alertBackgroundColor,
          contentPadding: contentPadding ??
              const EdgeInsets.fromLTRB(
                24.0,
                20.0,
                24.0,
                24.0,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.all(
                  Radius.circular(8.w),
                ),
          ),
          title: title,
          content: content,
        );
      },
    );
  }

  static Future<void>  bottomSheet({
    required BuildContext context,
    bool? isDismissable,
    required Widget content,
    BoxConstraints? boxConstraints,
  }) async{
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      constraints: boxConstraints,
      isScrollControlled: true,
      context: context,
      isDismissible: isDismissable ?? true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1a000000),
              offset: const Offset(0, 1),
              blurRadius: 3.r,
              spreadRadius: 0,
            )
          ],
          color: const Color(0xffffffff),
        ),
        child: content,
      ),
    );
  }

  static void showLoader() {
    showAlertDialog(
      content: const GlobalLoader(),
      barrierDismissible: false,
    );
  }
}
