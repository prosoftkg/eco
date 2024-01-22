import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/feature/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:eco_kg/feature/splash_feature/presentation/bloc/language_bloc.dart';
import 'package:eco_kg/feature/splash_feature/presentation/widget/button_with_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/splash_feature/domain/entity/language.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/servise_locator/servise_locator.dart';
import '../../../core/utils/user.dart';
import '../../user_cabinet_feature/domain/entities/userData.dart';
import '../../user_cabinet_feature/presentation/bloc/userDataBloc/user_data_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myBloc = getIt<AuthBloc>();
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: myBloc..add(const CheckLanguageEvent()),
        builder: (context, state) {
          if (state is CheckAuthKeyState) {
            BlocProvider.of<UserDataBloc>(context).add(ChangeUserDataEvent(
                userDataForEdit: UserDataForEdit(
              name: UserData.name ?? '',
              phone: UserData.phone ?? '',
            )));
            AutoRouter.of(context).replace(const HomeRoute());
          }
          if (state is BadAuthKeyState) {
            AutoRouter.of(context).replace(const SignInRoute());
          }
          if (state is CheckedLanguage) {
            Future.delayed(Duration(seconds: 3), () {
              BlocProvider.of<LanguageBloc>(context)
                  .add(SelectLanguageEvent(lanCode: state.lanCode));
              myBloc.add(CheckAuthKeyEvent());
            });


            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 62, horizontal: 16).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    Image.asset('assets/img/logo.png',
                        height: 280.h, width: 280.w),
                    const SizedBox()
                  ],
                ),
              ),
            );
          }
          if (state is NullLanguage) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 62, horizontal: 16).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    Image.asset('assets/img/logo.png',
                        height: 280.h, width: 280.w),
                    InkWell(
                        onTap: () async {
                          var items = Language.languageList();
                          await showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(top: BorderSide(width: 1.w))),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (var i = 0; i < items.length; i++)
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0).r,
                                            child: ListTile(
                                              title: Center(
                                                  child: Text(
                                                items[i].name,
                                                style: AppTextStyles
                                                    .clearSansMediumS18W500C009D9B,
                                              )),
                                              // leading: Text(items[i].flag),
                                              onTap: () {
                                                BlocProvider.of<LanguageBloc>(
                                                        context)
                                                    .add(SelectLanguageEvent(
                                                        lanCode: items[i]
                                                            .languageCode));
                                                myBloc.add(CheckAuthKeyEvent());
                                                AutoRouter.of(context).pop;
                                              },
                                            ),
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                            height: 1,
                                          )
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 358.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                              color: AppColors.colorEDF0F2,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              border: Border.all(
                                  width: 1, color: AppColors.color009D9B)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icon/global.png',
                                  height: 24.h, width: 24.w),
                              SizedBox(width: 10.w),
                              Text(context.text.select_language,
                                  style:
                                      AppTextStyles.clearSansMediumTextStyle16)
                            ],
                          ),
                        )
                        // buttonWithIcon(context.text.select_language, 'global.png'),
                        ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 62, horizontal: 16).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(),
                  Image.asset('assets/img/logo.png',
                      height: 280.h, width: 280.w),
                  const SizedBox()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
