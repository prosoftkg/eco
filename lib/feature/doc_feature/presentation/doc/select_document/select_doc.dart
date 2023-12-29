import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/feature/doc_feature/presentation/doc/select_document/sub_select_doc/sub_select_doc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../do_doc.dart';
import 'select_doc_provider.dart';

class SelectDoc extends StatefulWidget {
  const SelectDoc({Key? key}) : super(key: key);

  @override
  _SelectDocState createState() => _SelectDocState();
}

class _SelectDocState extends State<SelectDoc> {
  List<String> CategoryName = [
    'Общее',
    'Заявление',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Документы'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        separatorBuilder: (context, _) => SizedBox(height: 10),
        itemCount: CategoryName.length,
        itemBuilder: (context, index) => Select_doc_type(
            CategoryName[index], 'assets/img/category/cat$index.png'),
      ),
    );
  }

  Widget Select_doc_type(String name, String image) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubSelectDoc(nameDoc: name),
            ));
      },
      child: Ink(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.color009D9B,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
