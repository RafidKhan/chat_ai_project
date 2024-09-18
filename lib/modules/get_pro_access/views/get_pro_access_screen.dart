import 'package:chat_on/modules/get_pro_access/views/components/get_pro_access_gradient.dart';
import 'package:chat_on/modules/get_pro_access/views/components/get_pro_weekly_access.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/widget/global_gradient_button.dart';
import 'components/get_pro_access_header.dart';
import 'components/get_pro_access_image.dart';
import 'components/get_pro_access_marque.dart';
import 'components/get_pro_yearly_access.dart';

class GetProAccessScreen extends StatelessWidget {
  const GetProAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            const GetProAccessImage(),
            GetProAccessGradient(
              child: Column(
                children: [
                  SizedBox(
                    height: 270.h,
                  ),
                  const GetProAccessHeader(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const GetProAccessMarquee(),
                  const Spacer(),
                  const GetProYearlyAccess(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const GetProWeeklyAccess(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 50.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: GlobalGradientButton(
                      buttonText: context.loc.continue_text,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                top: 40.h,
              ),
              child: InkWell(
                onTap: () {
                  Navigation.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: KColor.white.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
