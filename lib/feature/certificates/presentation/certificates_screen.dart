import 'dart:io';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';
import '../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../doc_feature/presentation/doc/do_doc.dart';

class CertificatesScreen extends StatefulWidget {
  const CertificatesScreen({super.key});

  @override
  State<CertificatesScreen> createState() => _CertificatesScreenState();
}

class _CertificatesScreenState extends State<CertificatesScreen> {
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
• дата получения: 14/11/2023''','Bronze','Bronze ECO KG Certificate',context),
          space(),
          certificateItem('Сертификат маркировки Серебро','''• ECO KG: silver
• дата получения: 14/11/2023''','Silver','Silver ECO KG Certificate',context),
          space(),
          certificateItem('Сертификат маркировки Золото','''• ECO KG: gold
• дата получения: 14/11/2023''','Gold','Gold ECO KG Certificate',context),
          space(),
          certificateItem('Сертификат маркировки Платина','''• ECO KG: platinum
• дата получения: 14/11/2023''','Platinum','Platinum ECO KG Certificate',context),
        ],
      ),
    );
  }

  space() {
    return SizedBox(height: 32.h);
  }

  certificateItem(String title, String subtitle, String certificate,String pdfTitle,BuildContext context){
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
              InkWell(
                onTap: () {
                  // downloadDocument;
                  print('download');
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>  Doc(nameDoc: 'Заявление о принятии на работу',)/*GetCertificatScreen(testId: '',sum: '',)*/));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3).r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6).r,
                      border: Border.all(width: 1.w,color: AppColors.color009D9B)
                  ),
                  child: Center(child: Text('Скачать',style: AppTextStyles.clearSansS12C009D9BF400)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  downloadDocument() async {
    final pw.Document pdf = pw.Document();
    await generatesPdfAcceptWork(pdf);

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/statements.pdf');
    var created = await file.writeAsBytes(await pdf.save());
    await OpenFile.open(created.path);
  }

  generatesPdfAcceptWork(pw.Document pdf) async {
    final fontData = await rootBundle.load('assets/DejaVuSans.ttf');
    print(fontData.lengthInBytes);
    final font = pw.Font.ttf(fontData);
    final titleStyle = pw.TextStyle(
      fontWeight: pw.FontWeight.bold,
      fontSize: 20,
      color: PdfColors.black,
      font: font,
    );
    final contentStyle = pw.TextStyle(
      fontSize: 16,
      color: PdfColors.black,
      font: font,
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
            padding: pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'ЗАЯВЛЕНИЕ О ПРИНЯТИИ НА РАБОТУ',
                  style: titleStyle,
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Я, , прошу Вас, , принять в  на позицию .',
                  style: contentStyle,
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Дата: ${DateFormat.yMd('en_US').format(DateTime.now())}',
                  style: contentStyle,
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Подпись: ___________________',
                  style: contentStyle,
                ),
              ],
            ),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/заявление_об_увольнении.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
