import 'package:flutter/material.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/routing/navigation_services.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_icon.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/spaces.dart';
import '../models/product_model.dart';

class CategoryProductItem extends StatelessWidget {
  final Product product;

  const CategoryProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigationService.push(
        context,
        Routes.productDetailsScreen,
        arguments: {"product_id": product.id},
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s4.r),
        child: Container(
          decoration: const BoxDecoration(color: AppColors.lightGrey),
          child: Row(
            children: [
              SizedBox(
                height: 125.0.h,
                width: 125.0.h,
                child: CustomNetworkImage(image: product.imgUrl),
              ),
              HorizontalSpace(AppSize.s16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      product.title,
                      fontWeight: FontWeightManager.bold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Divider(),
                    CustomText(
                      product.catName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Divider(),
                    CustomText(
                      "${product.price.toString()} جنيه ",
                      color: AppColors.primary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              HorizontalSpace(AppSize.s16.w),
              const CustomIcon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
              ),
              HorizontalSpace(AppSize.s4.w),
            ],
          ),
        ),
      ),
    );
  }
}
