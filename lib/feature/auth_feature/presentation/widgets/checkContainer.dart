import 'package:eco_kg/core/utils/user.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget checkContainer(){
  return Container(
  width: UserData.sizeScreen ? 20.w : 20,
  height: UserData.sizeScreen ? 20.w : 20,
  decoration: BoxDecoration(
  color: AppColors
      .colorEAFEF1,
  borderRadius:
  BorderRadius
      .circular(
  6).r,
  border: Border.all(
  width:
  1,
  color: AppColors
      .color009D9B)),
  child: Center(
  child: Image
      .asset(
  'assets/icon/check.png',
  width: 14.w,
  height: 14.h,
  ),
  ),
  );
}