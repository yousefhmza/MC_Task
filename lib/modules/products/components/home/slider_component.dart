import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spaces.dart';
import '../../../../core/extensions/num_extensions.dart';
import '../../models/slider_model.dart';
import '../../viewmodels/products_viewmodel/products_states.dart';
import '../../viewmodels/products_viewmodel/products_viewmodel.dart';

class SliderComponent extends StatelessWidget {
  final List<SliderModel> sliders;

  const SliderComponent(this.sliders, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsVM = BlocProvider.of<ProductsViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 150.h,
          child: PageView.builder(
            onPageChanged: productsVM.setSliderIndex,
            itemCount: sliders.length,
            itemBuilder: (context, index) =>
                CustomNetworkImage(image: sliders[index].imgUrl),
          ),
        ),
        VerticalSpace(AppSize.s8.h),
        BlocBuilder<ProductsViewModel, ProductsStates>(
          buildWhen: (context, state) => state is SetSliderIndexState,
          builder: (context, state) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < sliders.length; i++)
                Container(
                  width: AppSize.s8.w,
                  height: AppSize.s3.w,
                  margin: EdgeInsets.symmetric(horizontal: AppSize.s4.w),
                  decoration: BoxDecoration(
                    color: i == productsVM.currentSliderIndex
                        ? AppColors.primary
                        : AppColors.grey,
                    shape: BoxShape.rectangle,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
