import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/retry_component.dart';
import '../../../core/extensions/num_extensions.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widgets/platform_widgets/loading_spinner.dart';
import '../../../core/widgets/spaces.dart';
import '../components/home/categories_component.dart';
import '../components/home/home_products_component.dart';
import '../components/home/slider_component.dart';
import '../models/category_model.dart';
import '../models/slider_model.dart';
import '../viewmodels/products_viewmodel/products_states.dart';
import '../viewmodels/products_viewmodel/products_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsViewModel productsVM =
        BlocProvider.of<ProductsViewModel>(context);
    return BlocBuilder<ProductsViewModel, ProductsStates>(
      buildWhen: (prevState, state) =>
          state is GetHomeSuccessState ||
          state is GetHomeLoadingState ||
          state is GetHomeFailureState,
      builder: (context, state) {
        if (state is GetHomeFailureState) {
          return RetryComponent(onRetry: () => productsVM.getHome());
        } else if (state is GetHomeLoadingState) {
          return const LoadingSpinner();
        } else {
          return _ScreenContent(productsVM.sliders, productsVM.categories);
        }
      },
    );
  }
}

class _ScreenContent extends StatelessWidget {
  final List<SliderModel> sliders;
  final List<CategoryModel> categories;

  const _ScreenContent(
    this.sliders,
    this.categories, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsViewModel productsVM =
        BlocProvider.of<ProductsViewModel>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: AppSize.s16.h),
      child: Column(
        children: [
          SliderComponent(sliders),
          VerticalSpace(AppSize.s36.h),
          CategoriesComponent(categories),
          VerticalSpace(AppSize.s36.h),
          BlocBuilder<ProductsViewModel, ProductsStates>(
            buildWhen: (prevState, state) => state is ToggleHomeProductsState,
            builder: (context, state) => HomeProductsComponent(
              productsVM
                  .groupedHomeProducts[productsVM.selectedProductsListIndex],
            ),
          )
        ],
      ),
    );
  }
}
