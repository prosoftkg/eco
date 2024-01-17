import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/itemSelect.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_story_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../../widgets/progressWidget.dart';
import '../bloc/story_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userStory = context.read<StoryBloc>()..add(UserStoryEvent());
    List<dynamic> story=[];
    List<String> testList= [
       'санаторно-курортные учреждения',
      'предприятия туризма',
      'предприятия общепита',
      'комбинированный тест'
    ];
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
      body: BlocBuilder<StoryBloc, StoryState>(
        bloc: userStory,
  builder: (context, state) {
    if (state is LoadingStoryState) {
      return Center(child: progressWidget());
    }
    if(state is LoadedUserStoryState){
      story=[...state.userHistoryEntity.test, ...state.userHistoryEntity.consultation, ...state.userHistoryEntity.application];
      // story.sort((a, b) => (a.audiDate ?? '').compareTo(b.auditDate ?? ''));
    }
    return ListView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16).r,
        children: [
          for(var temp in story)
            Column(
              children: [
                if(temp is Consultation)
                item('Получение консультации', '14/11/2023',
                    '''• экспресс-консультация по телефону (20 мин.)
• оплачено онлайн''',StoryItem.getConsultationOrGetCertificate),
                if(temp is Application)
                item('Заявка на сертификацию', '10/11/2023',
                    '''• оплачено онлайн''',StoryItem.getConsultationOrGetCertificate),
                if(temp is TestUser)
                item('Прохождение теста', temp.paymentDate ?? '05/11/2023',
                    '''Тест для ${testList[temp.categoryId!-1]}''',StoryItem.passingTest),
                space(),
              ],
            ),

        ],
      );
  },
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
                          Container(
                            width: 200.w,
                            child: Text(subtitle,
                                style: AppTextStyles.clearSansLightS12CBlackF300),
                          ),
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
