import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const TextStyle signUpTextFieldHeaderText = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textFormFieldInputText = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textFormFieldHintText = TextStyle(
    color: Colors.black.withOpacity(0.7),
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    color: AppColors.buttonTextColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle haveOrCreateAcoountTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle firstLineOfLoginScreen = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle secondLineOfLoginScreen = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
