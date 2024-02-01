import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/app_text_styles.dart';

Widget errorWidget(BuildContext context){
  return Padding(
    padding:  const EdgeInsets.all(16.0).r,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/error.png',width: 100.w,height: 100.h),
          SizedBox(height: 32.h),
          Text(context.text.error,style: AppTextStyles.clearSansMediumS22W500CBlack),
          SizedBox(height: 6.h),
          Text(context.text.error_text,style: AppTextStyles.clearSansS16cl82),
          SizedBox(height: 22.h),
          /*InkWell(onTap: (){
                        Navigator.pop(context);
                      },child: button(text: context.text.close))*/
        ],
      ),
    ),
  );
}