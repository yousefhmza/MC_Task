import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/routing/navigation_services.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/spaces.dart';
import '../../cart/models/cart_product_model.dart';
import '../../cart/view_models/cart_viewmodel/cart_viewmodel.dart';
import '../models/product_model.dart';
import 'add_to_cart_button.dart';

class HomeProductItem extends StatelessWidget {
  final Product product;

  const HomeProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartViewModel cartVM = BlocProvider.of<CartViewModel>(context);
    return InkWell(
      onTap: () => NavigationService.push(
        context,
        Routes.productDetailsScreen,
        arguments: {"product_id": product.id},
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s4.r),
        child: Container(
          color: AppColors.lightGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.0.h,
                width: double.infinity,
                child: CustomNetworkImage(image: product.imgUrl),
              ),
              VerticalSpace(AppSize.s8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.s8.w),
                child: CustomText(
                  product.title,
                  maxLines: 3,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeightManager.medium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              VerticalSpace(AppSize.s8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.s8.w),
                child: CustomText(
                  "${product.price.toString()} جنيه ",
                  maxLines: 2,
                  fontSize: FontSize.s16,
                  color: AppColors.primary,
                  fontWeight: FontWeightManager.medium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.s8.w),
                child: AddToCartButton(
                  onTap: () async {
                    await cartVM.addProduct(
                      CartProduct(
                        productID: product.id.toString(),
                        name: product.title,
                        image: product.imgUrl,
                        price: product.price.toString(),
                        quantity: 1,
                      ),
                    );
                    Alerts.showToast(AppStrings.addedToCart);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
