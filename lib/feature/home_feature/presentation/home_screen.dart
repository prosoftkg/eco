import 'dart:io';
import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/home_feature/widget/drawerWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/adaptive/size_config.dart';
import '../../../core/utils/alertDialog.dart';
import '../../test_feature/presentation/bloc/test_bloc.dart';
import '../domain/entities/test.dart';
import '../widget/bottom_background_image.dart';
import '../widget/testIcon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Test> testList= [
      Test(testNo: 1,testTitle: context.text.test1, iconPath: 'assets/icon/homeScreenIcon1.png',backColor: AppColors.colorEB5757.withOpacity(0.1)),
      Test(testNo: 2,testTitle: context.text.test2,iconPath: 'assets/icon/homeScreenIcon2.png',backColor: AppColors.colorF2C94C.withOpacity(0.1)),
      Test(testNo: 3,testTitle: context.text.test3,iconPath: 'assets/icon/homeScreenIcon3.png',backColor: AppColors.color56CCF2.withOpacity(0.1)),
      Test(testNo: 4,testTitle: context.text.test4,iconPath: 'assets/icon/homeScreenIcon4.png',backColor: AppColors.color9B51E0.withOpacity(0.1)),
    ];
    return WillPopScope(
      onWillPop: () async{
        var dialog = CustomAlertDialog(
            title: context.text.logout_from_app,
            message: context.text.logout_from_app_message,
            onPostivePressed: () async{
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            positiveBtnText: context.text.yes,
            negativeBtnText: context.text.no, onNegativePressed: (){});
        showDialog(
            context: context,
            builder: (BuildContext context) => dialog);
        return true;
      },
      child: Scaffold(
          drawer: DrawerBuild(),
          appBar: AppBar(
            title: Text(context.text.home),
          ),
          body: Stack(children: [
            bottomBackgroungImage(context),

            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              itemCount: testList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    BlocProvider.of<TestBloc>(context).add(TestInfoEvent(testInfo: testList[index]));
                    AutoRouter.of(context).push(const ScreenTestRoute());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: adaptive(context,358),
                    height: 88,
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 28,
                          color: AppColors.color009D9B.withOpacity(0.08),
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        testIconWidget(testList[index].backColor,testList[index].iconPath),
                        SizedBox(width: 12.w),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${context.text.test} ${index + 1}',
                                      style:
                                          AppTextStyles.clearSansMediumTextStyle18),
                                  // SizedBox(width: 180.w),
                                  const Icon(
                                    Icons.arrow_forward_outlined,
                                    color: AppColors.color009D9B,
                                  )
                                ],
                              ),
                              SizedBox(
                                  // width: 259,
                                  child: Text(
                                    testList[index].testTitle,
                                    style: AppTextStyles.hintStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 32);
              },
            ),
          ])),
    );
  }
}

