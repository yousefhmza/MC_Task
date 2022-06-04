import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/extensions/num_extensions.dart';
import '../../widgets/image_slider_arrow.dart';

class ProductImagesSliderComponent extends StatefulWidget {
  final List<String> images;

  const ProductImagesSliderComponent(this.images, {Key? key}) : super(key: key);

  @override
  State<ProductImagesSliderComponent> createState() =>
      _ProductImagesSliderComponentState();
}

class _ProductImagesSliderComponentState
    extends State<ProductImagesSliderComponent> {
  final PageController pageController = PageController();

  void _next() {
    pageController.nextPage(duration: Time.t300, curve: Curves.easeInOut);
  }

  void _prev() {
    pageController.previousPage(duration: Time.t300, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppSize.s48.r),
              ),
              child: CustomNetworkImage(image: widget.images[index]),
            ),
          ),
          ImageSliderArrow(
            icon: Icons.arrow_back,
            alignment: AlignmentDirectional.centerStart,
            onTap: _prev,
          ),
          ImageSliderArrow(
            icon: Icons.arrow_forward,
            alignment: AlignmentDirectional.centerEnd,
            onTap: _next,
          ),
        ],
      ),
    );
  }
}
