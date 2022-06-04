import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/spaces.dart';

class PrimaryDataComponent extends StatelessWidget {
  final String title;
  final int price;

  const PrimaryDataComponent(
    this.title,
    this.price, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title,
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.bold,
                ),
                VerticalSpace(AppSize.s8.h),
                CustomText(
                  "${price.toString()} جنيه ",
                  fontSize: FontSize.s18,
                  color: AppColors.primary,
                  fontWeight: FontWeightManager.medium,
                )
              ],
            ),
          ),
          CustomIconButton(
            icon: Icons.favorite_border,
            color: AppColors.primary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
