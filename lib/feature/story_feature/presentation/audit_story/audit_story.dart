import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/audit_story_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/servise_locator/servise_locator.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../../widgets/progressWidget.dart';
import '../bloc/story_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AuditStoryScreen extends StatelessWidget {
  const AuditStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auditStory = context.read<StoryBloc>()..add(AuditStoryEvent());
    List<dynamic> story=[];
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.history),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: UserData.sizeScreen ? 100.w : 100,
      ),
      body: BlocBuilder<StoryBloc, StoryState>(
        bloc: auditStory,
        builder: (context, state) {
          if (state is LoadingStoryState) {
            return Center(child: progressWidget());
          }
          if(state is LoadedAuditStoryState){
            story=[...state.auditStoryEntity.test, ...state.auditStoryEntity.consultation];
            story.sort((a, b) => (a.auditDate ?? DateTime.now()).compareTo(b.auditDate ?? DateTime.now()));
          }
          return ListView(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            children: [
              for(var temp in story.reversed)
                Column(children: [
                  temp is Consultation ?
                  item(context.text.conducting_consultation, '${temp.auditDate!.day}/${temp.auditDate!.month}/${temp.auditDate!.year}',
                      temp.userCompany!, temp.userRegion!) :

                  itemTest(context.text.conducting_audit, temp.auditDate!=null ? '${temp.auditDate.day}/${temp.auditDate.month}/${temp.auditDate.year}' : '' /*'05/11/2023'*/, temp.userCompany!, temp.userRegion!,'Тест, ${categoryType(temp.categoryId, context)}',context,temp.id.toString()),

                  space(),
                ])

              /*item('Проведение аудита', '05/11/2023',
                  '''Тест для предприятий туризма''', StoryItem.passingTest),*/
            ],
          );
        },
      ),
    );
  }

  categoryType(int id,BuildContext context){
    List<String> categoryList=[
      context.text.test1,
      context.text.test2,
      context.text.test3,
      context.text.test4
    ];
    return categoryList[id-1].toLowerCase();
  }
  item(String title, String date, String companyName,String region) {

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.circular(12),
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
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(companyName,
                        style: AppTextStyles.clearSansLightS12CBlackF300),
                    Text(region,
                        style: AppTextStyles.clearSansLightS12CBlackF300),
                  ],
                ),
              ],
            ),
          );
  }
  itemTest(String title, String date, String companyName,String region,String test,BuildContext context,String testId) {
    var myBloc=getIt<StoryBloc>();
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.circular(12),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: AppTextStyles.clearSansMediumS14CBlackF500),
                    Text(date, style: AppTextStyles.clearSansS12C82F400)
                  ],
                ),
                SizedBox(height: 10),
                Text(companyName,
                    style: AppTextStyles.clearSansLightS12CBlackF300),
                Text(region,
                    style: AppTextStyles.clearSansLightS12CBlackF300),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Image.asset(
                              'assets/icon/pdf.png', width: 24, height: 24),
                          SizedBox(width: 12),
                          Container(
                            width: 200.w,
                            child: Text(test,
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

  space() {
    return SizedBox(height: 22);
  }
}
