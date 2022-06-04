import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/spaces.dart';
import '../../models/product_model.dart';
import '../../viewmodels/products_viewmodel/products_viewmodel.dart';
import '../../widgets/home_product_item.dart';
import '../../widgets/toggle_products_button.dart';

class HomeProductsComponent extends StatelessWidget {
  List<Product> products;

  HomeProductsComponent(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsViewModel productsVM =
        BlocProvider.of<ProductsViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ToggleProductsButton(
                  isSelected: productsVM.selectedProductsListIndex == 0,
                  title: AppStrings.spareParts,
                  icon: Icons.settings,
                  onTap: () => productsVM.toggleHomeProducts(0),
                ),
              ),
              HorizontalSpace(AppSize.s8.w),
              Expanded(
                child: ToggleProductsButton(
                  isSelected: productsVM.selectedProductsListIndex == 1,
                  title: AppStrings.cars,
                  icon: Icons.directions_car,
                  onTap: () => productsVM.toggleHomeProducts(1),
                ),
              ),
              HorizontalSpace(AppSize.s8.w),
              Expanded(
                child: ToggleProductsButton(
                  isSelected: productsVM.selectedProductsListIndex == 2,
                  title: AppStrings.workshops,
                  icon: Icons.group_work,
                  onTap: () => productsVM.toggleHomeProducts(2),
                ),
              ),
            ],
          ),
          VerticalSpace(AppSize.s24.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) => HomeProductItem(products[index]),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              childAspectRatio: 0.65,
              mainAxisSpacing: 12.0.h,
              crossAxisSpacing: 12.0.h,
            ),
          ),
        ],
      ),
    );
  }
}
