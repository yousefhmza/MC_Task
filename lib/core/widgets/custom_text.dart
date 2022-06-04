import 'package:flutter/material.dart';

import '../extensions/num_extensions.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? height;
  final int? maxLines;

  const CustomText(
    this.text, {
    this.color = AppColors.black,
    this.fontSize = FontSize.s14,
    this.fontWeight = FontWeightManager.regular,
    this.textAlign,
    this.height,
    this.overflow,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontFamily: FontConstants.fontFamily,
        fontWeight: fontWeight,
        height: height?.h,
      ),
    );
  }
}
