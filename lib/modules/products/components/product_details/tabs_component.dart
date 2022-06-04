import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_text.dart';

class TabsComponent extends StatelessWidget {
  const TabsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: AppColors.lightGrey,
            child: const TabBar(
              indicatorColor: AppColors.primary,
              tabs: [
                Tab(
                  child: CustomText(
                    AppStrings.description,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
                Tab(
                  child: CustomText(
                    AppStrings.specs,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120.0.h,
            child: Padding(
              padding: EdgeInsets.all(AppSize.s16.w),
              child: const TabBarView(
                children: [
                  CustomText(AppStrings.loremIpsum),
                  CustomText(AppStrings.loremIpsum)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
