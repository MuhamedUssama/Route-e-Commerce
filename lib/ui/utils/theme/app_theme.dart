import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryolor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Color(0XFF06004F),
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
