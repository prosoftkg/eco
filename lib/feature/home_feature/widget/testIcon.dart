import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget testIconWidget(Color color,String path){
  return Container(
      padding: const EdgeInsets.all(16).r,
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color),
      child: Image.asset(path));
}