import 'package:flutter/material.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/custom_icons.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/spaces.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddToCartButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: AppColors.primary,
      isRounded: false,
      isOutlined: false,
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            AppStrings.addToCart,
            color: AppColors.white,
            fontWeight: FontWeightManager.medium,
          ),
          HorizontalSpace(AppSize.s8.w),
          const CustomIcon(CustomIcons.iconly_light_outline_buy)
        ],
      ),
    );
  }
}
