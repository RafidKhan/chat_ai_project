import 'package:chat_on/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/widget/global_image_loader.dart';
import '../../../../utils/styles/k_assets.dart';

class GetProAccessImage extends StatelessWidget {
  const GetProAccessImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  GlobalImageLoader(
      imagePath: KAssetName.sciFiLadyWebp.imagePath,
      height: 250.h,
      width: context.width,
      fit: BoxFit.fill,
    );
  }
}
