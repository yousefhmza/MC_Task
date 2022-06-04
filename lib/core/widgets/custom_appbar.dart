import 'package:flutter/material.dart';

import '../extensions/num_extensions.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import 'custom_text.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppbar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.primary,
      title: CustomText(
        title,
        color: AppColors.white,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSize.s18,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
