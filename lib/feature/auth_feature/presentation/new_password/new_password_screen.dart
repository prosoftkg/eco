import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../widgets/appBarLeadintBack.dart';
import '../widgets/button.dart';

class NewPaswordScreen extends StatefulWidget {
  const NewPaswordScreen({super.key});

  @override
  State<NewPaswordScreen> createState() => _NewPaswordScreenState();
}

class _NewPaswordScreenState extends State<NewPaswordScreen> {
  TextEditingController firstPassword = TextEditingController();
  TextEditingController secondPassword = TextEditingController();
  bool secure = true;
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)
        ),
        leadingWidth: 100,

      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(height: 60),
          Text(context.text.create_new_password,style: AppTextStyles.clearSansMediumTextStyle20),
          const SizedBox(height: 30),
          Text(context.text.confirm_new_password,style: AppTextStyles.clearSansMedium16cl82),
          const SizedBox(height: 30),
          passwordFieldTemplate(hintText: context.text.hint_new_password),
          const SizedBox(height: 16),
          secondPasswordFieldTemplate(hintText: context.text.repeat_password),
          const SizedBox(height: 80),
          InkWell(onTap:(){AutoRouter.of(context).push(const SuccessRoute());},child: button(text: context.text.save)),
        ],
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

  secondPasswordFieldTemplate(
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
