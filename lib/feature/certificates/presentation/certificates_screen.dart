import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';

class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.certificates),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 32,horizontal: 16),
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
    return SizedBox(height: 32);
  }
  certificateItem(String title, String subtitle, String certificate,String pdfTitle){
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppTextStyles.clearSansMediumS14CBlackF500),
                  SizedBox(height: 10),
                  Text(subtitle,
                      style: AppTextStyles.clearSansLightS12CBlackF300),
                ],
              ),
              Image.asset('assets/icon/certificate${certificate}.png',width: 62,height: 65),
            ],
          ),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Image.asset('assets/icon/pdf.png',width: 24,height: 24),
                    SizedBox(width: 12),
                    Text(pdfTitle,
                        style: AppTextStyles.clearSansLightS12CBlackF300),
                  ],
                ),
              ),
              Container(
                width: 56,
                height: 22,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 1,color: AppColors.color009D9B)
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
