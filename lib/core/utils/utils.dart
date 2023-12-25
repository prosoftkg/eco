import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'alertDialog.dart';

extension LocalizedText on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;
}

String? validateEmail(String value) {
  RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if(!regex.hasMatch(value)){
    return 'Введите электронную почту';
  }
  return null;
}

String? validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value.length == 0 || value.length < 12 || value.length > 12) {
    return 'Введите номер телефона';
  }
  else if (!regExp.hasMatch(value)) {
    return 'Введите номер телефона';
  }
  return null;
}
