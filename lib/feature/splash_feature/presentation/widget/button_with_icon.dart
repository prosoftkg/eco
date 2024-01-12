import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';

Widget buttonWithIcon(String buttonText,String icon){
  return Container(
    width: 358.w,
    height: 52.h,
    decoration: BoxDecoration(
        color: AppColors.colorEDF0F2,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 1,color: AppColors.color009D9B)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icon/$icon', height: 24.h, width: 24.w),
        SizedBox(width: 10.w),
        Text(buttonText,style: AppTextStyles.clearSansMediumTextStyle16)
      ],
    ),
  );
}