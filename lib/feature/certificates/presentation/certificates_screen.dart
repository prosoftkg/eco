import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';
import '../../auth_feature/presentation/widgets/appBarLeadintBack.dart';

class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 32,horizontal: 16).r,
        children: [
          certificateItem('Сертификат маркировки Бронза','''• ECO KG: bronze
• дата получения: 14/11/2023''','Bronze','Bronze ECO KG Certificate'),
          space(),
          certificateItem('Сертификат маркировки Серебро','''• ECO KG: silver
• дата получения: 14/11/2023''','Silver','Silver ECO KG Certificate'),
          space(),
          certificateItem('Сертификат маркировки Золото','''• ECO KG: gold
• дата получения: 14/11/2023''','Gold','Gold ECO KG Certificate'),
          space(),
          certificateItem('Сертификат маркировки Платина','''• ECO KG: platinum
• дата получения: 14/11/2023''','Platinum','Platinum ECO KG Certificate'),
        ],
      ),
    );
  }
  space() {
    return SizedBox(height: 32.h);
  }
  certificateItem(String title, String subtitle, String certificate,String pdfTitle){
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3).r,
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
