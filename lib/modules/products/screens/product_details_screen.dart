import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/components/retry_component.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/widgets/platform_widgets/loading_spinner.dart';
import '../../../core/widgets/spaces.dart';
import '../../../core/widgets/status_bar.dart';
import '../../cart/models/cart_product_model.dart';
import '../../cart/view_models/cart_viewmodel/cart_viewmodel.dart';
import '../components/product_details/primary_data_component.dart';
import '../components/product_details/prod_images_slider_component.dart';
import '../components/product_details/tabs_component.dart';
import '../models/product_model.dart';
import '../viewmodels/products_viewmodel/products_states.dart';
import '../viewmodels/products_viewmodel/products_viewmodel.dart';
import '../widgets/add_to_cart_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen(this.productId, {Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final ProductsViewModel productVM;

  @override
  void initState() {
    productVM = BlocProvider.of<ProductsViewModel>(context);
    productVM.getProduct(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DarkStatusBar(
      child: Scaffold(
        body: BlocBuilder<ProductsViewModel, ProductsStates>(
          buildWhen: (prevState, state) =>
              state is GetProductLoadingState ||
              state is GetProductSuccessState ||
              state is GetProductFailureState,
          builder: (context, state) {
            if (state is GetProductSuccessState) {
              return _ScreenContent(state.product);
            } else if (state is GetProductLoadingState) {
              return const LoadingSpinner();
            } else {
              return RetryComponent(
                onRetry: () => productVM.getProduct(widget.productId),
              );
            }
          },
        ),
      ),
    );
  }
}

class _ScreenContent extends StatelessWidget {
  final Product product;

  const _ScreenContent(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartViewModel cartVM = BlocProvider.of<CartViewModel>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProductImagesSliderComponent(product.images),
            VerticalSpace(AppSize.s24.h),
            PrimaryDataComponent(product.title, product.price),
            VerticalSpace(AppSize.s24.h),
            const TabsComponent(),
            VerticalSpace(AppSize.s24.h),
            Padding(
              padding: EdgeInsets.all(AppSize.s16.w),
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
    );
  }
}
