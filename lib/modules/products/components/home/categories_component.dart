import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/spaces.dart';
import '../../models/category_model.dart';
import '../../widgets/category_item.dart';

class CategoriesComponent extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesComponent(this.categories, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            AppStrings.categories,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: FontSize.s20,
          ),
          VerticalSpace(AppSize.s8.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) => CategoryItem(categories[index]),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 75.0.w,
              childAspectRatio: 0.8,
              mainAxisSpacing: 12.0.h,
              crossAxisSpacing: 12.0.h,
            ),
          ),
        ],
      ),
    );
  }
}
