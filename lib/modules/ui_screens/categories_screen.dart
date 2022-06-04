import 'package:flutter/material.dart';

import '../../core/resources/font_manager.dart';
import '../../core/resources/strings_manager.dart';
import '../../core/widgets/custom_text.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(
        AppStrings.categoriesScreen,
        fontWeight: FontWeightManager.medium,
        fontSize: FontSize.s18,
      ),
    );
  }
}
