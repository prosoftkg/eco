import 'package:eco_kg/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class Test{
  final int testNo;
  final String testTitle;
  final String iconPath;
  final Color backColor;
  final String subTitle;

  Test({required this.testNo, required this.testTitle,required this.iconPath,required this.backColor,required this.subTitle});

  static List<Test> testList= [
      Test(testNo: 1,testTitle: 'Санаторно-курортные учреждения',subTitle: 'Отель/ Гостиница/ Гостевой дом/ Хостел/ Пансионат/ Санаторий', iconPath: 'assets/icon/homeScreenIcon1.png',backColor: AppColors.colorEB5757.withOpacity(0.1)),
      Test(testNo: 2,testTitle: 'Предприятия туризма',subTitle: 'Отель/ Гостиница /Гостевой дом/ Хостел',iconPath: 'assets/icon/homeScreenIcon2.png',backColor: AppColors.colorF2C94C.withOpacity(0.1)),
      Test(testNo: 3,testTitle: 'Предприятия общепита',subTitle: 'Ресторан/ Кафе/ Столовая/ Кофейня',iconPath: 'assets/icon/homeScreenIcon4.png',backColor: AppColors.color56CCF2.withOpacity(0.1)),
      Test(testNo: 4,testTitle: 'Комбинированный',subTitle: 'Отель/ Гостиница + Ресторан/ Гостевой дом + Кафе/ Хостел + Мини кафе',iconPath: 'assets/icon/homeScreenIcon3.png',backColor: AppColors.color9B51E0.withOpacity(0.1)),
    ];
}