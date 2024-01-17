import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const  TextStyle clearSansMediumTextStyle16 =
  TextStyle(color: AppColors.colorBlack, fontSize: 16, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const  TextStyle clearSansMediumS13W500CBlack =
  TextStyle(color: AppColors.colorBlack, fontSize: 13, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const  TextStyle clearSansS13W400CBlack =
  TextStyle(color: AppColors.colorBlack, fontSize: 13, fontWeight: FontWeight.w400,fontFamily: 'ClearSans');
  static const  TextStyle clearSansS16W400CBlack =
  TextStyle(color: AppColors.colorBlack, fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'ClearSans');
  static const  TextStyle clearSansMedium16cl82 =
  TextStyle(color: AppColors.color828282, fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'ClearSansMedium');
  static const  TextStyle clearSansS16cl82 =
  TextStyle(color: AppColors.color828282, fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'ClearSans');
  static const  TextStyle clearSansS11clWhiteW700 =
  TextStyle(color: AppColors.colorWhite, fontSize: 11, fontWeight: FontWeight.w700,fontFamily: 'ClearSans');
  static const  TextStyle clearSansMedium22 =
  TextStyle(color: AppColors.colorBlack, fontSize: 22, fontWeight: FontWeight.w700,fontFamily: 'ClearSansMedium');
  static const  TextStyle clearSansMediumS22W500CBlack =
  TextStyle(color: AppColors.colorBlack, fontSize: 22, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const  TextStyle clearSansMediumTextStyle18 =
  TextStyle(color: AppColors.colorBlack, fontSize: 18, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const  TextStyle clearSansMediumTextStyle20 =
  TextStyle(color: AppColors.colorBlack, fontSize: 20, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const  TextStyle appBarLeadingStyle =
  TextStyle(color: AppColors.color009D9B, fontSize: 16, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const TextStyle hintStyle =
  TextStyle(color: AppColors.color828282, fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'ClearSans');
  static const  TextStyle linkTextStyle =
  TextStyle(color: AppColors.color2F89FC, fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'ClearSansMedium');
  static const  TextStyle buttonTextStyle =
  TextStyle(color: AppColors.colorWhite, fontSize: 16, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const TextStyle clearSansMediumS14C82F500 =
  TextStyle(color: AppColors.color828282, fontSize: 14, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const TextStyle clearSansMediumS14CBlackF500 =
  TextStyle(color: AppColors.colorBlack, fontSize: 14, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const TextStyle clearSansS12C82F400 =
  TextStyle(color: AppColors.color828282, fontSize: 12, fontWeight: FontWeight.w400,fontFamily: 'ClearSans');
  static const TextStyle clearSansLightS12CBlackF300 =
  TextStyle(color: AppColors.colorBlack, fontSize: 12, fontWeight: FontWeight.w300,fontFamily: 'ClearSansLight');
  static const TextStyle clearSansS12C009D9BF400 =
  TextStyle(color: AppColors.color009D9B, fontSize: 12, fontWeight: FontWeight.w400,fontFamily: 'ClearSans');
  static const TextStyle clearSansMediumS14W500C009D9B =
  TextStyle(color: AppColors.color009D9B, fontSize: 14, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const TextStyle clearSansMediumS18W500C009D9B =
  TextStyle(color: AppColors.color009D9B, fontSize: 18, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const TextStyle clearSansS12W400CBlack =
  TextStyle(color: AppColors.colorBlack, fontSize: 12, fontWeight: FontWeight.w400,fontFamily: 'ClearSans');
  static const TextStyle clearSansMediumS12W500CWhite =
  TextStyle(color: AppColors.colorWhite, fontSize: 12, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const TextStyle clearSansMediumS12W500C009D9B =
  TextStyle(color: AppColors.color009D9B, fontSize: 12, fontWeight: FontWeight.w500,fontFamily: 'ClearSansMedium');
  static const TextStyle clearSansS14CBlackF400 =
  TextStyle(color: AppColors.colorBlack, fontSize: 14, fontWeight: FontWeight.w400,fontFamily: 'ClearSans');
/*static const const TextStyle blackText = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w600, fontSize: 18);
  static const const TextStyle black12 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 12);
  static const const TextStyle black16 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 16);
  static const const TextStyle custom20 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 20);
  static const const TextStyle custom18 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 18);
  static const const TextStyle custom14 = TextStyle(
      color: AppColors.customText, fontWeight: FontWeight.w500, fontSize: 14);
  static const const TextStyle black14 = TextStyle(fontSize: 14, color: Colors.black);
  static const const TextStyle custom15 = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.customButton);
  static const const TextStyle black15 = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.customText);

  static const const TextStyle black26 = TextStyle(fontSize: 26);
  static const const TextStyle black20 = TextStyle(fontSize: 20);

  static const TextStyle black16Regular = TextStyle(
    fontSize: 16,
    fontFamily: 'Gilroy',
    height: 1.5,
    color: AppColors.mainBlack,
  );

  static const TextStyle black14Medium = TextStyle(
    fontSize: 14,
    fontFamily: 'Gilroy',
    height: 1.18,
    fontWeight: FontWeight.w500,
    color: AppColors.mainBlack,
  );

  static const TextStyle black18Semibold = TextStyle(
    fontSize: 18,
    fontFamily: 'Gilroy',
    height: 1.19,
    fontWeight: FontWeight.w600,
    color: AppColors.mainBlack,
  );

  static const TextStyle orange14Semibold = TextStyle(
    fontSize: 14,
    fontFamily: 'Gilroy',
    height: 1.19,
    fontWeight: FontWeight.w600,
    color: AppColors.mainColor,
  );

  static const TextStyle white16Bold = TextStyle(
    fontSize: 16,
    fontFamily: 'Gilroy',
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const TextStyle black20Bold = TextStyle(
    fontSize: 20,
    fontFamily: 'Gilroy',
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlack,
  );

  static const TextStyle black16Medium = TextStyle(
    fontSize: 16,
    fontFamily: 'Gilroy',
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.mainBlack,
  );*/
}
