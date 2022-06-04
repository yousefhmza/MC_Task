import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/num_extensions.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../services/responsive_service.dart';
import 'custom_icon.dart';
import 'custom_icon_button.dart';
import 'custom_text_field.dart';

class MainAppbar extends StatelessWidget with PreferredSizeWidget {
  const MainAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: AppPadding.p12.h),
          child: Row(
            children: [
              CustomIconButton(icon: Icons.menu, onPressed: () {}),
              const Expanded(
                child: CustomTextField(
                  hintText: AppStrings.search,
                  prefix: CustomIcon(Icons.search, color: AppColors.grey),
                  suffix: CustomIcon(
                    Icons.settings,
                    color: AppColors.grey,
                  ),
                ),
              ),
              CustomIconButton(icon: Icons.notifications, onPressed: () {})
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppSize.s16.r),
        ),
      ),
      titleSpacing: AppSize.s0,
      backgroundColor: AppColors.primary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(ResponsiveService.deviceTopPadding() + kToolbarHeight.h);
}
