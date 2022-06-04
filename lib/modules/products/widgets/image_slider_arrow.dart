import 'package:flutter/material.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widgets/custom_icon.dart';

class ImageSliderArrow extends StatelessWidget {
  final AlignmentDirectional alignment;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const ImageSliderArrow({
    required this.icon,
    required this.alignment,
    this.color = AppColors.white,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p16.w),
          child: Container(
            padding: EdgeInsets.all(AppPadding.p8.w),
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.25),
              shape: BoxShape.circle,
            ),
            child: CustomIcon(icon, color: color),
          ),
        ),
      ),
    );
  }
}
