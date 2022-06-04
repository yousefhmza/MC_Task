import 'package:flutter/material.dart';

import '../extensions/num_extensions.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const CustomIcon(
    this.icon, {
    this.color = AppColors.white,
    this.size = FontSize.s24,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color, size: size.sp);
  }
}
