import 'package:flutter/cupertino.dart';
import '../../../../core/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/user.dart';

Widget unCheckContainer(){
  return Container(
    width: UserData.sizeScreen ? 20.w : 20,
    height: UserData.sizeScreen ? 20.w : 20,
    decoration: BoxDecoration(
        borderRadius:
        BorderRadius
            .circular(
            6),
        border: Border.all(
            width:
            1,
            color: AppColors
                .color828282)),
  );
}