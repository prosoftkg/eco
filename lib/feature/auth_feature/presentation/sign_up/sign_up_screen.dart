import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/auto_route/auto_route.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../widgets/button.dart';
import 'package:auto_route/auto_route.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstPassword = TextEditingController();
  TextEditingController secondPassword = TextEditingController();
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.register),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(height: 30),
          Text(context.text.create_account,style: AppTextStyles.clearSansMediumTextStyle18),
          const SizedBox(height: 30),
          usernameFieldTemplate(hintText: context.text.username),
          const SizedBox(height: 16),
          emailFieldTemplate(hintText: context.text.email),
          const SizedBox(height: 16),
          passwordFieldTemplate(hintText: context.text.password),
          const SizedBox(height: 16),
          repeatPasswordFieldTemplate(hintText: context.text.repeat_password),
          const SizedBox(height: 30),
          button(text: context.text.sign_up),
          const SizedBox(height: 230),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${context.text.have_account} ',
                  style: AppTextStyles.clearSansMediumTextStyle16),
              InkWell(
                onTap: () {
                  AutoRouter.of(context).replace(const SignInRoute());
                },
                child: Text(context.text.login,
                    style: AppTextStyles.linkTextStyle),
              )
            ],
          ),
        ],
      ),
    );
  }

  usernameFieldTemplate(
      {required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 358,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.colorF7F7F7,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 274,
        child: TextField(
          controller: userName,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppTextStyles.hintStyle,
          ),
        ),
      ),
    );
  }

  emailFieldTemplate(
      {required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 358,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.colorF7F7F7,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 274,
        child: TextField(
          controller: email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppTextStyles.hintStyle,
          ),
        ),
      ),
    );
  }

  passwordFieldTemplate(
      {required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 358,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.colorF7F7F7,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 274,
            child: TextField(
              obscuringCharacter: '*',
              controller: firstPassword,
              obscureText: secure,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: AppTextStyles.hintStyle,
              ),
            ),
          ),
            InkWell(
              onTap: () {
                secure = !secure;
                setState(() {});
              },
              child: SizedBox(
                width: 28,
                child: Icon(
                    secure ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                    color: AppColors.color828282),
              ),
            )
        ],
      ),
    );
  }

  repeatPasswordFieldTemplate(
      {required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 358,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.colorF7F7F7,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 274,
            child: TextField(
              obscuringCharacter: '*',
              controller: secondPassword,
              obscureText: secure,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: AppTextStyles.hintStyle,
              ),
            ),
          ),
            InkWell(
              onTap: () {
                secure = !secure;
                setState(() {});
              },
              child: SizedBox(
                width: 28,
                child: Icon(
                    secure ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                    color: AppColors.color828282),
              ),
            )
        ],
      ),
    );
  }
}
