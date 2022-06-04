import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/components/retry_component.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/platform_widgets/loading_spinner.dart';
import '../../../core/widgets/spaces.dart';
import '../models/product_model.dart';
import '../viewmodels/products_viewmodel/products_states.dart';
import '../viewmodels/products_viewmodel/products_viewmodel.dart';
import '../widgets/category_product_item.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String catName;
  final int catId;

  const CategoryProductsScreen(this.catId, this.catName, {Key? key})
      : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  late final ProductsViewModel productsVM;

  @override
  void initState() {
    productsVM = BlocProvider.of<ProductsViewModel>(context);
    productsVM.getCategoryProducts(widget.catId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: widget.catName),
      body: BlocBuilder<ProductsViewModel, ProductsStates>(
        buildWhen: (prevState, state) =>
            state is GetCatProductsLoadingState ||
            state is GetCatProductsFailureState ||
            state is GetCatProductsSuccessState,
        builder: (context, state) {
          if (state is GetCatProductsSuccessState) {
            return _ScreenContent(state.products);
          } else if (state is GetCatProductsLoadingState) {
            return const LoadingSpinner();
          } else {
            return RetryComponent(
              onRetry: () => productsVM.getProduct(widget.catId),
            );
          }
        },
      ),
    );
  }
}

class _ScreenContent extends StatelessWidget {
  final List<Product> products;

  const _ScreenContent(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppPadding.p16.w),
      itemBuilder: (context, index) => CategoryProductItem(products[index]),
      separatorBuilder: (context, index) => VerticalSpace(AppSize.s24.h),
      itemCount: products.length,
    );
  }
}
