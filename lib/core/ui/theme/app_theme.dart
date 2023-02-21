import 'package:flutter/material.dart';
import 'package:trybu/core/ui/styles/app_style.dart';

import '../styles/app_colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: 'Mulish',
    primarySwatch: AppColors.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyle.elevatedButtonTheme,
    ),
    bottomNavigationBarTheme: AppStyle.themeBottomNavigation,
  );
}
