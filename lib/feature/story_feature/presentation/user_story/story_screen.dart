import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/itemSelect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.history),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16).r,
        children: [
          item('Получение консультации', '14/11/2023',
              '''• экспресс-консультация по телефону (20 мин.)
• оплачено онлайн''',StoryItem.getConsultationOrGetCertificate),
          space(),
          item('Заявка на сертификацию', '10/11/2023',
              '''• оплачено онлайн''',StoryItem.getConsultationOrGetCertificate),
          space(),
          item('Прохождение теста', '05/11/2023',
              '''Тест для предприятий туризма''',StoryItem.passingTest),
        ],
      ),
    );
  }

  item(String title, String date, String subtitle, StoryItem storyItem) {
    switch (storyItem) {
      case StoryItem.getConsultationOrGetCertificate:
        {
          return Container(
            padding: const EdgeInsets.all(16).r,
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.circular(12).r,
              boxShadow: [
                BoxShadow(
                  blurRadius: 28,
                  color: AppColors.color009D9B.withOpacity(0.08),
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Container(
              padding: const EdgeInsets.all(16),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: testList[index].backColor),
              child: Image.asset(testList[index].iconPath)),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: AppTextStyles.clearSansMediumS14CBlackF500),
                    Text(date, style: AppTextStyles.clearSansS12C82F400)
                  ],
                ),
                SizedBox(height: 10.h),
                Text(subtitle,
                    style: AppTextStyles.clearSansLightS12CBlackF300),
              ],
            ),
          );
        }
      case StoryItem.passingTest:
        {
          return Container(
            padding: const EdgeInsets.all(16).r,
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.circular(12).r,
              boxShadow: [
                BoxShadow(
                  blurRadius: 28,
                  color: AppColors.color009D9B.withOpacity(0.08),
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Container(
              padding: const EdgeInsets.all(16),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: testList[index].backColor),
              child: Image.asset(testList[index].iconPath)),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: AppTextStyles.clearSansMediumS14CBlackF500),
                    Text(date, style: AppTextStyles.clearSansS12C82F400)
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Image.asset('assets/icon/pdf.png',width: 24.w,height: 24.h),
                          SizedBox(width: 12.w),
                          Text(subtitle,
                              style: AppTextStyles.clearSansLightS12CBlackF300),
                        ],
                      ),
                    ),
                    Container(
                      width: 56.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6).r,
                        border: Border.all(width: 1.w,color: AppColors.color009D9B)
                      ),
                      child: Center(child: Text('Скачать',style: AppTextStyles.clearSansS12C009D9BF400)),
                    )
                  ],
                ),
              ],
            ),
          );
        }
    }
  }

  space() {
    return SizedBox(height: 22.w);
  }
}
