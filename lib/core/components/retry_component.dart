import 'package:flutter/material.dart';

import '../extensions/num_extensions.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/spaces.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class RetryComponent extends StatelessWidget {
  final VoidCallback onRetry;
  final String? errorMessage;

  const RetryComponent({
    required this.onRetry,
    this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              errorMessage ?? AppStrings.noInternetConnection,
              textAlign: TextAlign.center,
              height: AppSize.s1_5.h,
              color: AppColors.grey,
            ),
            VerticalSpace(AppSize.s24.h),
            SizedBox(
              width: 125.w,
              child: CustomButton(
                color: AppColors.primary,
                isRounded: true,
                isOutlined: true,
                onPressed: onRetry,
                child: const CustomText(AppStrings.retry),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
