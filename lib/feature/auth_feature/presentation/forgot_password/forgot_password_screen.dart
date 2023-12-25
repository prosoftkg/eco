import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../widgets/appBarLeadintBack.dart';
import '../widgets/button.dart';

class ForgotPaswordScreen extends StatefulWidget {
  const ForgotPaswordScreen({super.key});

  @override
  State<ForgotPaswordScreen> createState() => _ForgotPaswordScreenState();
}

class _ForgotPaswordScreenState extends State<ForgotPaswordScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstPassword = TextEditingController();
  TextEditingController secondPassword = TextEditingController();
  bool secure = true;
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(height: 30),
          Text(context.text.forgot_password,
              style: AppTextStyles.clearSansMediumTextStyle20),
          const SizedBox(height: 10),
          Text(context.text.forgotPassword_subtitle,
              style: AppTextStyles.clearSansMedium16cl82),
          const SizedBox(height: 50),
          emailFieldTemplate(hintText: context.text.email),
          const SizedBox(height: 80),
          InkWell(
              onTap: () {
                AutoRouter.of(context).push(const VerificationRoute());
              },
              child: button(text: context.text.send_code)),
          const SizedBox(height: 230),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${context.text.remember_password} ',
                  style: AppTextStyles.clearSansMediumTextStyle16),
              InkWell(
                onTap: () {
                  AutoRouter.of(context).pop();
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

  emailFieldTemplate({required String hintText}) {
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
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: AppTextStyles.hintStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
