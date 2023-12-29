import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bottomBackgroungImage(BuildContext context){
  return Positioned(
    bottom: 32.h,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/img/bottom_background_image.png',
        height: 30.75.h,
        repeat: ImageRepeat.repeatX,
      ),
    ),
  );
}