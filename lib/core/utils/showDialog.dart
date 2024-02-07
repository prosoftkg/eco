import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../style/app_colors.dart';
import 'alertDialog.dart';

Widget errorDialog(BuildContext context){
  return CustomAlertDialog(
      title: context.text.error,
      message: context.text.error_text,
      onPostivePressed: () async{
      },
      positiveBtnText: context.text.close,
      negativeBtnText: '', onNegativePressed: (){});
  /*AlertDialog(
        surfaceTintColor: AppColors.colorWhite,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Image.asset('assets/img/error.png',width: 100.w,height: 100.h),
                SizedBox(height: 32.h),
                Text(context.text.error,style: AppTextStyles.clearSansMediumS22W500CBlack),
                SizedBox(height: 6.h),
                Text(context.text.error_text,style: AppTextStyles.clearSansS16cl82),
                SizedBox(height: 22.h),
                InkWell(onTap: (){
                  Navigator.pop(context);
                },child: button(text: context.text.close))
              ],
            ),
          ),
        ));*/
}