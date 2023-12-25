import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

Widget testNo(String number,[bool select=false]){
  return Container(
    width: 32,
    height: 32,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: select ? AppColors.color009D9B : AppColors.colorD4D4D4,
      border: select ? Border.all(width: 1) : null
    ),
    child: Center(
      child: Text(number,style: AppTextStyles.buttonTextStyle),
    ),
  );
}