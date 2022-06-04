import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;

  const CustomNetworkImage({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: AppImages.shimmer,
      image: image,
      fit: BoxFit.cover,
      placeholderFit: BoxFit.cover,
    );
  }
}
