import 'package:flutter/material.dart';
import '../../core/style/app_text_styles.dart';
import '../splash_feature/domain/entity/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../splash_feature/presentation/bloc/language_bloc.dart';

Future<void> callShowModelBottomSheet(BuildContext context) async{
  var items=Language.languageList();
  await showModalBottomSheet
    (
    barrierColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(width: 1)
          )
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for(var i=0;i<items.length;i++)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: ListTile(
                      title: Center(child: Text(items[i].name,style: AppTextStyles.clearSansMediumS18W500C009D9B,)),
                      // leading: Text(items[i].flag),
                      onTap: (){
                        BlocProvider.of<LanguageBloc>(context).add(SelectLanguageEvent(lanCode: items[i].languageCode));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Divider(color: Colors.black,height: 1,)
                ],
              )
          ],
        ),
      ),
    ),
  );
}
