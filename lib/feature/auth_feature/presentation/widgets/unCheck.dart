import 'package:flutter/cupertino.dart';
import '../../../../core/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget unCheckContainer(){
  return Container(
    width: 20.w,
    height: 20.h,
    decoration: BoxDecoration(
        borderRadius:
        BorderRadius
            .circular(
            6),
        border: Border.all(
            width:
            1,
            color: AppColors
                .color828282)),
  );
}