import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../widgets/appBarLeadintBack.dart';
import '../widgets/button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 80),
          Image.asset('assets/img/success.png', height: 100, width: 100),
          const SizedBox(height: 30),
          Center(
              child: Text(context.text.password_changed,
                  style: AppTextStyles.clearSansMediumTextStyle20)),
          const SizedBox(height: 20),
          Center(
              child: Text(context.text.password_changed_subtitle,
                  style: AppTextStyles.clearSansMedium16cl82)),
          const SizedBox(height: 80),
          InkWell(
              onTap: () {
                AutoRouter.of(context).replaceAll([const SignInRoute()]);
              },
              child: button(text: context.text.return_to_auth))
        ],
      ),
    );
  }
}
