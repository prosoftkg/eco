import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/utils/user.dart';
import '../../../user_cabinet_feature/domain/entities/userData.dart';
import '../../../user_cabinet_feature/presentation/bloc/userDataBloc/user_data_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


final _formKey=GlobalKey<FormState>();

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController email = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.auth),
      ),
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: 30.w),
        children: [
           SizedBox(height: 30.h),
          Image.asset('assets/img/logo.png', height: 216.h, width: 216.w),
           SizedBox(height: 20.h),
          Form(
            key: _formKey,
            child: emailFieldTemplate(hintText: context.text.email),
          ),
           SizedBox(height: 8.h),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    // AutoRouter.of(context).push( ForgotPasswordRoute());
                  },
                  child: Text(context.text.forgot_password,
                      style: AppTextStyles.linkTextStyle)),
            ],
          ),*/
           SizedBox(height: 20.h),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoadingAuthState) {
                return Center(child: progressWidget());
              }
              if (state is SuccessfullySignInState) {
                AutoRouter.of(context).push(const VerificationRoute());
              }
              if(state is ErrorAuthState){
                return Column(
                  children: [
                    InkWell(onTap: () {
                  BlocProvider.of<AuthBloc>(context)
                    .add(SignInEvent(email: email.text));
                }, child: button(text: context.text.continue_word)),
                     SizedBox(height: 10.h),
                    Center(child: Text(state.error.toString()),),
                  ],
                );
              }
              return InkWell(onTap: () {
                if(_formKey.currentState!.validate()){
                  BlocProvider.of<AuthBloc>(context)
                      .add(SignInEvent(email: email.text));
                }
              }, child: button(text: context.text.continue_word));
            },
          ),
           /*SizedBox(height: 200.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.text.no_account,
                  style: AppTextStyles.clearSansMediumTextStyle16),
              InkWell(
                onTap: () {
                  // AutoRouter.of(context).replace( SignUpRoute());
                },
                child: Text(' ${context.text.sign_up}',
                    style: AppTextStyles.linkTextStyle),
              )
            ],
          ),*/
        ],
      ),
    );
  }

  emailFieldTemplate({required String hintText}) {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.hintStyle,
      ),
      validator: (value)=> validateEmail(value!),
    );
  }
}
