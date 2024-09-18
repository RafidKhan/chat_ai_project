import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_on/global/widget/global_circular_loader.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter/material.dart';

class GlobalImageLoader extends StatelessWidget {
  const GlobalImageLoader({
    Key? key,
    required this.imagePath,
    this.imageFor = ImageFor.asset,
    this.height,
    this.width,
    this.fit,
    this.color,
  }) : super(key: key);
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final ImageFor imageFor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (imageFor == ImageFor.network) {
      return CachedNetworkImage(
        imageUrl: imagePath.trim(),
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => const GlobalCircularLoader(),
        errorWidget: (context, url, error) {
          return const SizedBox.shrink();
        },
      );
      // return Image.network(
      //   imagePath,
      //   height: height,
      //   width: width,
      //   fit: fit,
      //   color: color,
      //   errorBuilder: (context, exception, stackTrace) => Icon(
      //     Icons.error,
      //     color: KColor.red.color,
      //   ),
      // );
    } else if (imageFor == ImageFor.file) {
      return Image.file(File(imagePath),
          height: height,
          width: width,
          fit: fit,
          color: color, errorBuilder: (context, exception, stackTrace) {
        return const SizedBox.shrink();
      });
    } else {
      return Image.asset(imagePath,
          height: height,
          width: width,
          fit: fit,
          color: color, errorBuilder: (context, exception, stackTrace) {
        return const SizedBox.shrink();
      });
    }
  }
}
