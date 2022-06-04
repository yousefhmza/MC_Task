import 'package:flutter/material.dart';
import 'package:mc_task/core/routing/navigation_services.dart';
import 'package:mc_task/core/routing/routes.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/spaces.dart';
import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigationService.push(
        context,
        Routes.categoryProductsScreen,
        arguments: {"cat_id": category.id, "cat_name": category.title},
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ClipOval(
              child: Container(
                color: AppColors.lightGrey,
                child: CustomNetworkImage(image: category.imgUrl),
              ),
            ),
          ),
          VerticalSpace(AppSize.s8.h),
          CustomText(
            category.title,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
