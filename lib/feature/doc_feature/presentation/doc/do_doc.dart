import 'dart:io';
import 'package:eco_kg/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class Doc extends StatefulWidget {
  final nameDoc;


   Doc({Key? key, required this.nameDoc}) : super(key: key);
  @override
  State<Doc> createState() => _DocState(nameDoc);
}

class _DocState extends State<Doc> {
  TextEditingController name = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController directorName = TextEditingController();
  TextEditingController position = TextEditingController();

  final String nameDoc;
  _DocState(this.nameDoc);
  Future<void> downloadDocument() async {
    final pw.Document pdf = pw.Document();
    switch (nameDoc) {
      case 'Заявление об увольнении':
        await generatesPdfDismissal(pdf);
        break;
      case 'Заявление о принятии на работу':
        await generatesPdfAcceptWork(pdf);
        break;
    }

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/statements.pdf');
    var created = await file.writeAsBytes(await pdf.save());
    await OpenFile.open(created.path);
  }

  Future<void> generatesPdfDismissal(pw.Document pdf) async {
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
                  'ЗАЯВЛЕНИЕ ОБ УВОЛЬНЕНИИ',
                  style: titleStyle,
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Я, ${name.text}, прошу Вас, ${directorName.text}, расторгнуть мои трудовые отношения из позиции ${position.text} с ${companyName.text} с момента подачи данного заявления.',
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

  Future<void> generatesPdfAcceptWork(pw.Document pdf) async {
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
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'ЗАЯВЛЕНИЕ О ПРИНЯТИИ НА РАБОТУ',
                  style: titleStyle,
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Я, ${name.text}, прошу Вас, ${directorName.text}, принять в ${companyName.text} на позицию ${position.text}.',
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nameDoc),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.color009D9B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'ФИО',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.color009D9B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: companyName,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Место работы',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.color009D9B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: position,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Должность',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.color009D9B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: directorName,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Имя директора',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: downloadDocument,
            child: Text('Скачать заявление'),
          ),
        ],
      ),
    );
  }
}
