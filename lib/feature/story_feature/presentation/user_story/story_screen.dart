import 'package:eco_kg/core/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/itemSelect.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_story_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/servise_locator/servise_locator.dart';
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
      story.sort((a, b) => (a.createDate ?? '').compareTo(b.createDate ?? ''));
    }
    return ListView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16).r,
        children: [
          for(var temp in story.reversed)
            Column(
              children: [
                if(temp is Consultation)
                item(context.text.getting_advice, '${temp.createDate!.day}/${temp.createDate!.month}/${temp.createDate!.year}',
                    '''• ${context.text.express_consultation}
• ${context.text.paid_online}''',StoryItem.getConsultationOrGetCertificate,temp.id.toString()),
                if(temp is Application)
                item(context.text.application_certification, '${temp.createDate!.day}/${temp.createDate!.month}/${temp.createDate!.year}',
                    '''• ${context.text.paid_online}''',StoryItem.getConsultationOrGetCertificate,temp.id.toString()),
                if(temp is TestUser)
                item(context.text.passing_test, '${temp.createDate!.day}/${temp.createDate!.month}/${temp.createDate!.year}',
                    '''${context.text.test_for} ${testList[temp.categoryId!-1]}''',StoryItem.passingTest,temp.id.toString()),
                space(),
              ],
            ),

        ],
      );
  },
),
    );
  }
  

  item(String title, String date, String subtitle, StoryItem storyItem,String testId) {
    var myBloc=getIt<StoryBloc>();
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
                    BlocBuilder<StoryBloc, StoryState>(
                      bloc: myBloc,
  builder: (context, state) {
    if (state is LoadingStoryState) {
      return Center(child: progressWidget());
    }
    if(state is DownloadedUserStoryState){
      launchUrl(Uri.parse(state.urlForDownload));
    }
    return InkWell(
                      onTap: (){
                       myBloc.add(DowloadUserStoryEvent(test_id: testId));
                      },
                      child: Container(
                        width: 56.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6).r,
                          border: Border.all(width: 1.w,color: AppColors.color009D9B)
                        ),
                        child: Center(child: Text(context.text.download,style: AppTextStyles.clearSansS12C009D9BF400)),
                      ),
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
  }

  space() {
    return SizedBox(height: 22.w);
  }
}
