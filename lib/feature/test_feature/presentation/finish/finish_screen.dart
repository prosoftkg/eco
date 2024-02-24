import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import '../../../../core/auto_route/auto_route.dart';
import '../../../home_feature/widget/bottom_background_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    Text(
                        context.text.emailSentWithTestResults,
                        style: AppTextStyles.clearSansS16cl82,
                        textAlign: TextAlign.center),
                    const SizedBox(),
                    InkWell(
                      child: button(text: context.text.finish),
                      onTap: () {
                        AutoRouter.of(context).replace(const ResultTestRoute());
                      },
                    )
                  ],
                ),
              ),
              bottomBackgroungImage(context)
            ],
          )),
    );
  }
}
