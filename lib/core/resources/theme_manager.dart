import 'package:flutter/material.dart';

import 'color_manager.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primary,
        ),
        dividerColor: AppColors.grey,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      );
}
