import 'package:url_launcher/url_launcher.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import '../../../core/servise_locator/servise_locator.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';
import '../../../core/utils/errorInfo.dart';
import '../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../story_feature/domain/entities/user_certificate_entity.dart';
import '../../story_feature/presentation/bloc/story_bloc.dart';
import '../../widgets/progressWidget.dart';
import 'bloc/user_certificate_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CertificatesScreen extends StatefulWidget {
  const CertificatesScreen({super.key});

  @override
  State<CertificatesScreen> createState() => _CertificatesScreenState();
}

class _CertificatesScreenState extends State<CertificatesScreen> {
  var certificates={
    'Платина' : 'Platinum',
    'Золото' : 'Gold',
    'Серебро' : 'Silver',
    'Бронза' : 'Bronze',
  };
  var myBloc=getIt<StoryBloc>();
  @override
  Widget build(BuildContext context) {

    List<UserCertificate> userCertificate=[];
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.certificates),
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100.w,
      ),
      body: BlocBuilder<UserCertificateBloc, UserCertificateState>(
        bloc: BlocProvider.of<UserCertificateBloc>(context)..add(LoadUserCertificateEvent()),
  builder: (context, state) {
    if (state is LoadingUserCertificateState) {
      return Center(child: progressWidget());
    }
    if(state is LoadedUserCertificateState){
      userCertificate=state.userCertificate;
      userCertificate.sort((a, b) => (a.createDate!).compareTo(b.createDate!));
    }
    if(state is ErrorUserCertificateState){
      return errorWidget(context);
    }
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 32,horizontal: 16).r,
        children: [
          for(var temp in userCertificate)
            Column(
              children: [
                certificateItem('${context.text.certificateOfMarking} ${certificates[temp.certificateType]}','''• ECO KG: ${certificates[temp.certificateType]}
• ${context.text.dateReceived} ${temp.createDate!.day}/${temp.createDate!.month}/${temp.createDate!.year}''','${certificates[temp.certificateType]}','${certificates[temp.certificateType]} ECO KG Certificate',context,temp.id.toString()),
                space(),
              ],
            ),

          /*certificateItem('Сертификат маркировки Серебро','''• ECO KG: silver
• дата получения: 14/11/2023''','Silver','Silver ECO KG Certificate',context),
          space(),
          certificateItem('Сертификат маркировки Золото','''• ECO KG: gold
• дата получения: 14/11/2023''','Gold','Gold ECO KG Certificate',context),
          space(),
          certificateItem('Сертификат маркировки Платина','''• ECO KG: platinum
• дата получения: 14/11/2023''','Platinum','Platinum ECO KG Certificate',context),*/
        ],
      );
  },
),
    );
  }

  space() {
    return SizedBox(height: 32.h);
  }


  certificateItem(String title, String subtitle, String certificate,String pdfTitle,BuildContext context,String testId){
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppTextStyles.clearSansMediumS14CBlackF500),
                  SizedBox(height: 10.h),
                  Text(subtitle,
                      style: AppTextStyles.clearSansLightS12CBlackF300),
                ],
              ),
              Image.asset('assets/icon/certificate${certificate}.png',width: 62.w,height: 65.h),
            ],
          ),
          SizedBox(height: 22.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Image.asset('assets/icon/pdf.png',width: 24.w,height: 24.h),
                    SizedBox(width: 12.w),
                    Text(pdfTitle,
                        style: AppTextStyles.clearSansLightS12CBlackF300),
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
                onTap: () {
                  myBloc.add(DowloadUserStoryEvent(test_id: testId));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3).r,
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
