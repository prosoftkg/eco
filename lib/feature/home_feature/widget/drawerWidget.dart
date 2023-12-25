import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/audit_test_consult_feature/presentation/audit_consultation/audit_consultation_screen.dart';
import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:eco_kg/feature/terms_of_use_feature/presentation/terms_of_use.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../core/auto_route/auto_route.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';
import '../../../core/utils/alertDialog.dart';
import '../../audit_story/presentation/audit_story.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../certificates/presentation/certificates_screen.dart';
import '../../consultation_feature/presentation/consultation_screen.dart';
import '../../get_certificate/presentation/get_certificate_screen.dart';
import '../../story_feature/presentation/story_screen.dart';
import '../../user_cabinet_feature/presentation/bloc/userDataBloc/user_data_bloc.dart';
import '../../widgets/showModelBottomSheet.dart';
import '../domain/entities/drawerEnum.dart';
import 'bottom_background_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget drawerBuild(BuildContext context,UserEnum userEnum){
  const storage = FlutterSecureStorage();

  buildMenu(String icon,String menuName,BuildContext context,DrawerSelect drawerSelect){
    return InkWell(
      onTap: () async {
        switch(drawerSelect){
          case DrawerSelect.userCabinet: {
            AutoRouter.of(context).push(const UserCabinetRoute());
          } break;
          case DrawerSelect.getConsultation: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ConsultationScreen(testId: '1')));
          }break;
          case DrawerSelect.library: {
            AutoRouter.of(context).push(const LibraryRoute());
          }break;
          case DrawerSelect.getCertificate: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const GetCertificatScreen()));
          }break;
          case DrawerSelect.story: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>userEnum==UserEnum.auditor? const AuditStoryScreen() : const StoryScreen()));
          }break;
          case DrawerSelect.certificates: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const CertificatesScreen()));
          }break;
          case DrawerSelect.auditConsultation: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const AuditConsultationScreen()));
          }break;
          case DrawerSelect.audit: {
            AutoRouter.of(context).push(const AuditRoute());
            // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const AuditScreen()));
          }break;
          case DrawerSelect.language: {
            callShowModelBottomSheet(context);
          }break;
          case DrawerSelect.termsOfUse:{
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const TermsOfUse()));
          }break;
          case DrawerSelect.exit: {
            await storage.delete(key: 'authKey');
            var dialog = CustomAlertDialog(
              title: "Выход",
              message: "Вы действительно хотите выйти?",
              onPostivePressed: () {
                AutoRouter.of(context).replaceAll([const SignInRoute()]);
              },
              positiveBtnText: 'Да',
              negativeBtnText: 'Нет', onNegativePressed: (){},);
            showDialog(
                context: context,
                builder: (BuildContext context) => dialog);

          }break;
          default:{

          }
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/icon/$icon',width: 20.w,height: 20.h),
              SizedBox(width: 12.w),
              Text(
                menuName,
                style: AppTextStyles.clearSansS16W400CBlack,
              )
            ],
          ),
          SizedBox(height: 10.h)
        ],
      ),
    );
  }
  
  switch(userEnum){
    case UserEnum.auditor: {
      return BlocBuilder<UserDataBloc, UserDataState>(
        builder: (context, state) {
    return SafeArea(
        child: Drawer(
          surfaceTintColor: AppColors.colorWhite,
          child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 85).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16).r,
                            color: AppColors.colorF7F7F7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 37.h),
                                Text(
                                  state.userData.name,
                                  style: AppTextStyles.clearSansMediumTextStyle16,
                                ),
                                Text(
                                  context.text.audit,
                                  style: AppTextStyles.hintStyle,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16,right: 16,top: 32).r,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.text.basic,
                                      style: AppTextStyles.clearSansMediumS14C82F500,
                                    ),
                                    SizedBox(height: 16.h),

                                    buildMenu('user.png',context.text.user_cabinet,context,DrawerSelect.userCabinet),
                                    buildMenu('message-search.png',context.text.consultations,context,DrawerSelect.auditConsultation),
                                    buildMenu('receipt-search.png',context.text.audit,context,DrawerSelect.audit),
                                    buildMenu('clock.png',context.text.history,context,DrawerSelect.story),
                                    SizedBox(height: 22.h),
                                    Text(
                                      context.text.settings,
                                      style: AppTextStyles.clearSansMediumS14C82F500,
                                    ),
                                    SizedBox(height: 16.h),
                                    buildMenu('clipboard-text.png',context.text.terms_of_use,context,DrawerSelect.termsOfUse),
                                    buildMenu('language-square.png',context.text.language,context,DrawerSelect.language),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0).r,
                        child: buildMenu('logout.png',context.text.exit,context,DrawerSelect.exit),
                      ),
                    ],
                  ),
                ),
                // Positioned(bottom: 85,left: 16, child: buildMenu('logout.png',context.text.exit,context,DrawerSelect.exit)),
                bottomBackgroungImage(context)
              ]
          ),
        ),
      );
  },
);
    }
    case UserEnum.applicant:{
      return BlocBuilder<UserDataBloc, UserDataState>(
        builder: (context, state) {
    return SafeArea(
        child: Drawer(
          surfaceTintColor: AppColors.colorWhite,
          child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 85).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16).r,
                          color: AppColors.colorF7F7F7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 37.h),
                              Text(
                                state.userData.name,
                                style: AppTextStyles.clearSansMediumTextStyle16,
                              ),
                              Text(
                                context.text.applicant,
                                style: AppTextStyles.hintStyle,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16,top: 32).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.text.basic,
                                    style: AppTextStyles.clearSansMediumS14C82F500,
                                  ),
                                  SizedBox(height: 16.h),
                                  buildMenu('user.png',context.text.user_cabinet,context,DrawerSelect.userCabinet),
                                  buildMenu('message-search.png',context.text.get_consultation,context,DrawerSelect.getConsultation),
                                  buildMenu('medal-star.png',context.text.get_certificate,context,DrawerSelect.getCertificate),
                                  buildMenu('clock.png',context.text.history,context,DrawerSelect.story),
                                  buildMenu('medal.png',context.text.certificates,context,DrawerSelect.certificates),
                                  buildMenu('book.png',context.text.library,context,DrawerSelect.library),
                                  SizedBox(height: 22.h),
                                  Text(
                                    context.text.settings,
                                    style: AppTextStyles.clearSansMediumS14C82F500,
                                  ),
                                  SizedBox(height: 16.h),
                                  buildMenu('people.png',context.text.about_the_project,context,DrawerSelect.aboutProject),
                                  buildMenu('clipboard-text.png',context.text.terms_of_use,context,DrawerSelect.termsOfUse),
                                  buildMenu('language-square.png',context.text.language,context,DrawerSelect.language),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0).r,
                      child: buildMenu('logout.png',context.text.exit,context,DrawerSelect.exit),
                    ),
                  ],
                  ),
                ),
                // Positioned(bottom: 85,left: 16, child: buildMenu('logout.png',context.text.exit,context,DrawerSelect.exit)),
                bottomBackgroungImage(context)
              ]
          ),
        ),
      );
  },
);
    }
  }
}