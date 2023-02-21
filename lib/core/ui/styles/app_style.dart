import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyle {
  AppStyle._();

  static ButtonStyle elevatedButtonTheme = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontWeight: FontWeight.normal),
    primary: AppColors.primaryColor,
    elevation: 0,
    onPrimary: AppColors.white,
    shape:  RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(11),
    ),
  );

  static ButtonStyle outlineButtonTheme = OutlinedButton.styleFrom(
   
    primary: AppColors.brownColor,
    side: const BorderSide(color: AppColors.brownColor),
    elevation: 0,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AppColors.brownColor),
      borderRadius: BorderRadius.circular(11),
    ),
  );

  static BottomNavigationBarThemeData themeBottomNavigation = const  BottomNavigationBarThemeData(
     backgroundColor: AppColors.backgroundColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.brownColor,
      unselectedItemColor: Colors.grey,
      elevation: 10,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
  );

  static InputDecoration inputDecorationStyle = const InputDecoration(
    isDense: true,
    fillColor: Color.fromARGB(255, 228, 228, 228),
    filled: true,
    hintStyle: TextStyle(color: AppColors.brownColor),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  );
}
