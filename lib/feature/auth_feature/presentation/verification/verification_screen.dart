import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import '../../../../core/auto_route/auto_route.dart';
import '../../../../core/servise_locator/servise_locator.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/utils/user.dart';
import '../../../user_cabinet_feature/domain/entities/userData.dart';
import '../../../user_cabinet_feature/presentation/bloc/userDataBloc/user_data_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/appBarLeadintBack.dart';
import '../widgets/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _onEditing = true;
  String _code = '';
  var myBloc = getIt<AuthBloc>();
  var email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100.w,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30).r,
        children: [
          SizedBox(height: 30.h),
          Text(context.text.verification_code,
              style: AppTextStyles.clearSansMediumTextStyle20),
          SizedBox(height: 10.h),
          Text(context.text.verification_code_subtitle,
              style: AppTextStyles.clearSansMedium16cl82),
          SizedBox(height: 50.h),
          VerificationCode(
            underlineWidth: 1.2.w,
            fullBorder: true,
            fillColor: AppColors.colorE8ECF4,
            itemSize: 60.sp,
            textStyle: AppTextStyles.clearSansMedium22,
            keyboardType: TextInputType.number,
            underlineColor: AppColors.color009D9B,
            length: 4,
            cursorColor: AppColors.color009D9B,
            underlineUnfocusedColor: AppColors.colorE8ECF4,
            //colorAfter: AppColors.color009D9B,
            margin: const EdgeInsets.all(12).r,
            onCompleted: (String value) {
              setState(() {
                _code = value;
              });
              print(_code);
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
          SizedBox(height: 80.h),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoadingAuthState) {
                return Center(child: progressWidget());
              }
              if (state is SuccessfullySignInState) {
                email = state.email;
              }
              if (state is SuccessfullyCheckCodeState) {
                BlocProvider.of<UserDataBloc>(context).add(ChangeUserDataEvent(
                    userDataForEdit: UserDataForEdit(
                  name: UserData.name ?? '',
                  phone: UserData.phone ?? '',
                )));
                AutoRouter.of(context).replaceAll([const HomeRoute()]);
              }
              if (state is ErrorAuthState) {
                return Column(
                  children: [
                    InkWell(
                        onTap: () {
                          if (_code.length == 4)
                            BlocProvider.of<AuthBloc>(context)
                                .add(CheckConfirmationCodeEvent(code: _code!));
                        },
                        child: button(text: context.text.apply)),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(state.error.toString()),
                    ),
                  ],
                );
              }
              return InkWell(
                  onTap: () {
                    if (_code.length == 4)
                      BlocProvider.of<AuthBloc>(context)
                          .add(CheckConfirmationCodeEvent(code: _code!));
                  },
                  child: button(text: context.text.apply));
            },
          ),
          SizedBox(height: 230.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${context.text.smsNot} ',
                  style: AppTextStyles.clearSansMediumTextStyle16),
              BlocBuilder<AuthBloc, AuthState>(
                bloc: myBloc,
                builder: (context, state) {
                  if (state is LoadingAuthState) {
                    return Center(child: progressWidget());
                  }
                  return InkWell(
                    onTap: () {
                      myBloc.add(SignInEvent(email: email));
                    },
                    child: Text(context.text.send_code_again,
                        style: AppTextStyles.linkTextStyle),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
