import 'dart:ui';

import 'package:flutter/material.dart';

Widget ShowDialogTextStyle(String text, {required TextStyle style}){
  return DefaultTextStyle(style: style,child: Text(text));
}