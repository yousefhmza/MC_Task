import 'package:flutter/material.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widgets/custom_icon.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/spaces.dart';

class ToggleProductsButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ToggleProductsButton({
    required this.isSelected,
    required this.title,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.white : AppColors.primary,
            borderRadius: BorderRadius.circular(AppSize.s8.r),
            border: Border.all(color: AppColors.primary, width: AppSize.s1_5),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                blurRadius: 4.r,
                offset: Offset(0, 2.h),
                spreadRadius: 1.r,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIcon(
              icon,
              size: AppSize.s20,
              color: isSelected ? AppColors.primary : AppColors.white,
            ),
            HorizontalSpace(AppSize.s4.w),
            CustomText(
              title,
              color: isSelected ? AppColors.primary : AppColors.white,
              fontWeight: FontWeightManager.medium,
            )
          ],
        ),
      ),
    );
  }
}
