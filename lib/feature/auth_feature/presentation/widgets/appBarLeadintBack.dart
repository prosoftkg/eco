import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/app_text_styles.dart';

Widget appBarLeading(BuildContext context){
  return Row(
    children: [
      SizedBox(width: 5.w),
      Icon(Icons.arrow_back_ios_new,size: UserData.sizeScreen ? 24.w : 24),
      Text(context.text.back,style: AppTextStyles.appBarLeadingStyle,)
    ],
  );
}