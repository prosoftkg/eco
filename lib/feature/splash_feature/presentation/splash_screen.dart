import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/feature/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:eco_kg/feature/splash_feature/presentation/bloc/language_bloc.dart';
import 'package:eco_kg/feature/splash_feature/presentation/widget/button_with_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/splash_feature/domain/entity/language.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if(state is CheckAuthKeyState){
            AutoRouter.of(context).replace(const HomeRoute());
          }
          if(state is BadAuthKeyState){
            AutoRouter.of(context).replace(const SignInRoute());
          }
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 62.h,horizontal: 16.w),
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
            const SizedBox(),
            Image.asset('assets/img/logo.png', height: 280.h, width: 280.w),
            InkWell(
              onTap: () async{
                var items=Language.languageList();
                await showModalBottomSheet(
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 1.w)
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for(var i=0;i<items.length;i++)
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(items[i].name),
                                  leading: Text(items[i].flag),
                                  onTap: (){
                                    BlocProvider.of<LanguageBloc>(context).add(SelectLanguageEvent(lanCode: items[i].languageCode));
                                    BlocProvider.of<AuthBloc>(context).add(CheckAuthKeyEvent());
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              const Divider(color: Colors.black,height: 1,)
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                );

              },
              child: buttonWithIcon(context.text.select_language, 'global.png'),
            )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
