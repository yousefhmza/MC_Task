import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/extensions/num_extensions.dart';
import '../../../core/widgets/custom_icon.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../../core/widgets/spaces.dart';
import '../models/cart_product_model.dart';
import '../view_models/cart_viewmodel/cart_viewmodel.dart';

class CartItem extends StatelessWidget {
  final CartProduct product;
  final int index;

  const CartItem(this.product, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartViewModel cartVM = BlocProvider.of<CartViewModel>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.s4.r),
      child: Container(
        decoration: const BoxDecoration(color: AppColors.lightGrey),
        child: Row(
          children: [
            SizedBox(
              height: 125.0.h,
              width: 125.0.h,
              child: CustomNetworkImage(image: product.image),
            ),
            HorizontalSpace(AppSize.s16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    product.name,
                    fontWeight: FontWeightManager.bold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  VerticalSpace(AppSize.s8.h),
                  CustomText(
                    "${product.price} جنيه ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  VerticalSpace(AppSize.s8.h),
                  Row(
                    children: [
                      _QuantityButton(
                        icon: Icons.add,
                        onTap: () => cartVM.increaseQuantity(index),
                      ),
                      HorizontalSpace(AppSize.s8.w),
                      CustomText(
                        product.quantity.toString(),
                        fontWeight: FontWeightManager.bold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      HorizontalSpace(AppSize.s8.w),
                      _QuantityButton(
                        icon: Icons.remove,
                        onTap: () => cartVM.decreaseQuantity(index),
                      ),
                    ],
                  )
                ],
              ),
            ),
            CustomIconButton(
              icon: Icons.delete,
              color: AppColors.primary,
              onPressed: () => cartVM.deleteProduct(product.productID),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppPadding.p8.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.s4.r),
          border: Border.all(color: AppColors.black, width: AppSize.s1_5.w),
        ),
        child: CustomIcon(icon, color: AppColors.black),
      ),
    );
  }
}
