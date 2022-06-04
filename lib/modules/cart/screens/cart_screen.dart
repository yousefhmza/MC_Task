import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/spaces.dart';
import '../view_models/cart_viewmodel/cart_states.dart';
import '../view_models/cart_viewmodel/cart_viewmodel.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartViewModel cartVM = BlocProvider.of<CartViewModel>(context);
    return Padding(
      padding: EdgeInsets.all(AppPadding.p16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            AppStrings.cart,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: FontSize.s20,
          ),
          Expanded(
            child: BlocBuilder<CartViewModel, CartStates>(
              builder: (context, state) => cartVM.cartProductsList.isEmpty
                  ? const Center(
                      child: CustomText(
                        AppStrings.emptyCart,
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.medium,
                      ),
                    )
                  : ListView.separated(
                      itemCount: cartVM.cartProductsList.length,
                      itemBuilder: (context, index) =>
                          CartItem(cartVM.cartProductsList[index], index),
                      separatorBuilder: (context, index) =>
                          VerticalSpace(AppSize.s24.h),
                    ),
            ),
          ),
          VerticalSpace(AppSize.s12.h),
          Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(AppSize.s4.r),
            ),
            child: Center(
              child: BlocBuilder<CartViewModel, CartStates>(
                builder: (context, state) => CustomText(
                  " المجموع ${cartVM.totalPrice} جنية ",
                  color: AppColors.primary,
                  fontWeight: FontWeightManager.bold,
                  fontSize: FontSize.s18,
                ),
              ),
            ),
          ),
          VerticalSpace(AppSize.s12.h),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              child: const CustomText(AppStrings.pay, color: AppColors.white),
              color: AppColors.primary,
              widerPadding: true,
              isRounded: false,
              isOutlined: false,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
