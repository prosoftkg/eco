import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(
    surfaceTintColor: AppColors.colorWhite,
    centerTitle: true,
    titleTextStyle: AppTextStyles.clearSansMediumTextStyle16,
      iconTheme: const IconThemeData(
          color: AppColors.color009D9B
      ),
      backgroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.colorWhite,
  primaryColor: AppColors.color009D9B,
);
