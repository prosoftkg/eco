import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/about_project_feature/presentation/about_project.dart';
import 'package:eco_kg/feature/audit_test_consult_feature/presentation/audit_consultation/audit_consultation_screen.dart';
import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:eco_kg/feature/terms_of_use_feature/presentation/terms_of_use.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../core/auto_route/auto_route.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';
import '../../../core/utils/alertDialog.dart';
import '../../../core/utils/user.dart';
import '../../story_feature/presentation/audit_story/audit_story.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../certificates/presentation/certificates_screen.dart';
import '../../story_feature/presentation/user_story/story_screen.dart';
import '../../user_cabinet_feature/presentation/bloc/userDataBloc/user_data_bloc.dart';
import '../../widgets/showModelBottomSheet.dart';
import '../domain/entities/drawerEnum.dart';
import 'bottom_background_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DrawerBuild extends StatefulWidget {
   DrawerBuild({super.key});

  @override
  State<DrawerBuild> createState() => _DrawerBuildState();
}

class _DrawerBuildState extends State<DrawerBuild> {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {

    switch(UserData.userRole){
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

                                          buildMenu('user.png',context.text.user_cabinet,DrawerSelect.userCabinet,context),
                                          buildMenu('message-search.png',context.text.consultations,DrawerSelect.auditConsultation,context),
                                          buildMenu('receipt-search.png',context.text.audit,DrawerSelect.audit,context),
                                          buildMenu('clock.png',context.text.history,DrawerSelect.story,context),
                                          SizedBox(height: 22.h),
                                          Text(
                                            context.text.settings,
                                            style: AppTextStyles.clearSansMediumS14C82F500,
                                          ),
                                          SizedBox(height: 16.h),
                                          buildMenu('clipboard-text.png',context.text.terms_of_use,DrawerSelect.termsOfUse,context),
                                          buildMenu('language-square.png',context.text.language,DrawerSelect.language,context),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0).r,
                              child: buildMenu('logout.png',context.text.exit,DrawerSelect.exit,context),
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
                                          SizedBox(height: 6.h),
                                          buildMenu('user.png',context.text.user_cabinet,DrawerSelect.userCabinet,context),
                                          buildMenu('message-search.png',context.text.get_consultation,DrawerSelect.getConsultation,context),
                                          buildMenu('medal-star.png',context.text.get_certificate,DrawerSelect.getCertificate,context),
                                          buildMenu('clock.png',context.text.history,DrawerSelect.story,context),
                                          buildMenu('medal.png',context.text.certificates,DrawerSelect.certificates,context),
                                          buildMenu('book.png',context.text.library,DrawerSelect.library,context),
                                          SizedBox(height: 22.h),
                                          Text(
                                            context.text.settings,
                                            style: AppTextStyles.clearSansMediumS14C82F500,
                                          ),
                                          SizedBox(height: 16.h),
                                          buildMenu('people.png',context.text.about_the_project,DrawerSelect.aboutProject,context),
                                          buildMenu('clipboard-text.png',context.text.terms_of_use,DrawerSelect.termsOfUse,context),
                                          buildMenu('language-square.png',context.text.language,DrawerSelect.language,context),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0).r,
                              child: buildMenu('logout.png',context.text.exit,DrawerSelect.exit,context),
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

  buildMenu(String icon,String menuName,DrawerSelect drawerSelect,BuildContext context){
    return InkWell(
      onTap: () async {
        switch(drawerSelect){
          case DrawerSelect.userCabinet: {
            AutoRouter.of(context).push(const UserCabinetRoute());
          } break;
          case DrawerSelect.getConsultation: {
            AutoRouter.of(context).push(const GetConsultDrawerRoute());
          }break;
          case DrawerSelect.library: {
            AutoRouter.of(context).push(const LibraryRoute());
          }break;
          case DrawerSelect.getCertificate: {
            AutoRouter.of(context).push(const GetCertificateDrawerRoute());
            // Navigator.of(context).push(MaterialPageRoute(builder:(context)=> SelectDoc()/*GetCertificatScreen(testId: '',sum: '',)*/));
          }break;
          case DrawerSelect.story: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>UserData.userRole==UserEnum.auditor? const AuditStoryScreen() : const StoryScreen()));
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
          case DrawerSelect.aboutProject:{
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const AboutProject()));
          }break;
          case DrawerSelect.language: {
            callShowModelBottomSheet(context);
          }break;
          case DrawerSelect.termsOfUse:{
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const TermsOfUse()));
          }break;
          case DrawerSelect.exit: {

            var dialog = CustomAlertDialog(
                title: context.text.logout_from_app,
                message: context.text.logout_from_app_message,
                onPostivePressed: () async{
                  await storage.delete(key: 'authKey');
                  AutoRouter.of(context).replaceAll([const SignInRoute()]);
                },
                positiveBtnText: context.text.yes,
                negativeBtnText: context.text.no, onNegativePressed: (){});
            showDialog(
                context: context,
                builder: (BuildContext context) => dialog);

          }break;
          default:{

          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0).r,
        child: Row(
          children: [
            Image.asset('assets/icon/$icon',width: 20.w,height: 20.h),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                menuName,
                style: AppTextStyles.clearSansS16W400CBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
Widget drawerBuild(BuildContext context,UserEnum userEnum){
  const storage = FlutterSecureStorage();

  buildMenu(String icon,String menuName,DrawerSelect drawerSelect){
    return InkWell(
      onTap: () async {
        switch(drawerSelect){
          case DrawerSelect.userCabinet: {
            AutoRouter.of(context).push(const UserCabinetRoute());
          } break;
          case DrawerSelect.getConsultation: {
            AutoRouter.of(context).push(const GetConsultDrawerRoute());
          }break;
          case DrawerSelect.library: {
            AutoRouter.of(context).push(const LibraryRoute());
          }break;
          case DrawerSelect.getCertificate: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=> SelectDoc()*/
/*GetCertificatScreen(testId: '',sum: '',)*//*
));
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
          case DrawerSelect.aboutProject:{
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const AboutProject()));
          }break;
          case DrawerSelect.language: {
            callShowModelBottomSheet(context);
          }break;
          case DrawerSelect.termsOfUse:{
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const TermsOfUse()));
          }break;
          case DrawerSelect.exit: {

            var dialog = CustomAlertDialog(
              title: "Выход",
              message: "Вы действительно хотите выйти?",
              onPostivePressed: () async{
                await storage.delete(key: 'authKey');
                AutoRouter.of(context).replaceAll([const SignInRoute()]);
              },
              positiveBtnText: 'Да',
              negativeBtnText: 'Нет', onNegativePressed: (){});
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

                                    buildMenu('user.png',context.text.user_cabinet,DrawerSelect.userCabinet),
                                    buildMenu('message-search.png',context.text.consultations,DrawerSelect.auditConsultation),
                                    buildMenu('receipt-search.png',context.text.audit,DrawerSelect.audit),
                                    buildMenu('clock.png',context.text.history,DrawerSelect.story),
                                    SizedBox(height: 22.h),
                                    Text(
                                      context.text.settings,
                                      style: AppTextStyles.clearSansMediumS14C82F500,
                                    ),
                                    SizedBox(height: 16.h),
                                    buildMenu('clipboard-text.png',context.text.terms_of_use,DrawerSelect.termsOfUse),
                                    buildMenu('language-square.png',context.text.language,DrawerSelect.language),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0).r,
                        child: buildMenu('logout.png',context.text.exit,DrawerSelect.exit),
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
                                  buildMenu('user.png',context.text.user_cabinet,DrawerSelect.userCabinet),
                                  buildMenu('message-search.png',context.text.get_consultation,DrawerSelect.getConsultation),
                                  // buildMenu('medal-star.png',context.text.get_certificate,context,DrawerSelect.getCertificate),
                                  buildMenu('clock.png',context.text.history,DrawerSelect.story),
                                  buildMenu('medal.png',context.text.certificates,DrawerSelect.certificates),
                                  buildMenu('book.png',context.text.library,DrawerSelect.library),
                                  SizedBox(height: 22.h),
                                  Text(
                                    context.text.settings,
                                    style: AppTextStyles.clearSansMediumS14C82F500,
                                  ),
                                  SizedBox(height: 16.h),
                                  buildMenu('people.png',context.text.about_the_project,DrawerSelect.aboutProject),
                                  buildMenu('clipboard-text.png',context.text.terms_of_use,DrawerSelect.termsOfUse),
                                  buildMenu('language-square.png',context.text.language,DrawerSelect.language),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0).r,
                      child: buildMenu('logout.png',context.text.exit,DrawerSelect.exit),
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
}*/
