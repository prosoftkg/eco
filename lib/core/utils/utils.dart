import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../feature/library_feature/domain/entities/library_entity.dart';
import 'alertDialog.dart';

extension LocalizedText on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;
}


String? validateEmail(String value) {
  RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if(!regex.hasMatch(value)){
    return 'Email';
  }
  return null;
}

String? validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value.length == 0 || value.length < 12 || value.length > 12) {
    return 'Phone';
  }
  else if (!regExp.hasMatch(value)) {
    return 'Phone';
  }
  return null;
}


String getTypeList(List<CatListElement> typeList){
  String temp='';
  for(var item in typeList){
    temp+= '${item.title}/';
  }
  temp=temp.replaceFirst('/', '',temp.length-1);
  return temp;
}

String sumConsult(String categoryId,String companyArea){
  int catIdTemp=int.parse(categoryId);
  print(categoryId+' categoruId');
  print(companyArea+' companyArea');
  if(catIdTemp < 3 && companyArea=='1'){
    print('first');
    return '8900';
  }else if(catIdTemp < 3 && companyArea=='2'){
    return '17800';
  }else if(catIdTemp < 3 && companyArea=='3'){
    return '31000';
  }else if(catIdTemp > 2 && companyArea=='4'){
    return '17000';
  }else if(catIdTemp > 2 && companyArea=='5'){
    return '31000';
  }else{
    return '62000';
  }
}

String sumCertificate(String categoryId,String companyArea){
  int catIdTemp=int.parse(categoryId);
  if(catIdTemp < 3 && companyArea=='1'){
    return '18000';
  }else if(catIdTemp < 3 && companyArea=='2'){
    return '31000';
  }else if(catIdTemp < 3 && companyArea=='3'){
    return '45000';
  }else if(catIdTemp > 2 && companyArea=='4'){
    return '31000';
  }else if(catIdTemp > 2 && companyArea=='5'){
    return '45000';
  }else{
    return '90000';
  }
}