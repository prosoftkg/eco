import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/app_text_styles.dart';

Widget appBarLeading(BuildContext context){
  return Row(
    children: [
      const SizedBox(width: 5),
      const Icon(Icons.arrow_back_ios_new),
      Text(context.text.back,style: AppTextStyles.appBarLeadingStyle,)
    ],
  );
}