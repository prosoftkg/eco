import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userData.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/servise_locator/servise_locator.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../bloc/userCabinetBloc/user_cabinet_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import '../bloc/userDataBloc/user_data_bloc.dart';

final _formKey = GlobalKey<FormState>();

class EditScreen extends StatefulWidget {
  EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    name.text = UserData.name ?? '';
    phone.text = UserData.phone ?? '';
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  var myBloc=getIt<UserCabinetBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(context.text.data_editing),
        leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100.h,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 64).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    UserData.userRole == UserEnum.applicant
                        ? context.text.data_editing_text_applicant
                        : context.text.data_editing_text_audit,
                    style: AppTextStyles.clearSansS16cl82),
                SizedBox(height: 32.h),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.text.fullName,
                          style: AppTextStyles.clearSansMediumS14C82F500),
                      SizedBox(height: 8.h),
                      emailFieldTemplate(hintText: context.text.fullName),
                      SizedBox(height: 30.h),
                      Text(context.text.phone,
                          style: AppTextStyles.clearSansMediumS14C82F500),
                      SizedBox(height: 8.h),
                      phoneFieldTemplate(hintText: context.text.phone),
                    ],
                  ),
                ),
              ],
            ),
            BlocBuilder<UserCabinetBloc, UserCabinetState>(
              bloc: myBloc,
              builder: (context, state) {
                if (state is LoadingUserCabinetState) {
                  return Center(child: progressWidget());
                }
                if (state is SuccessfullyEditUserDataState) {
                  BlocProvider.of<UserDataBloc>(context)
                      .add(ChangeUserDataEvent(userDataForEdit: UserDataForEdit(
                    name: name.text,
                    phone: phone.text,
                  )));
                  AutoRouter.of(context).pop();
                }
                return InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      var userDataForEdit = UserDataForEdit(
                        name: name.text,
                        phone: phone.text,
                      );
                      myBloc.add(EditUserDataEvent(userDataForEdit: userDataForEdit));
                    }
                  },
                  child: button(text: context.text.save),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  emailFieldTemplate({required String hintText}) {
    return TextFormField(
      controller: name,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: 'Асанов Асан',
        hintStyle: AppTextStyles.hintStyle,
      ),
      validator: (name) => name!.length > 0 ? null : context.text.enterFullName,
    );
  }

  phoneFieldTemplate({required String hintText}) {
    return TextFormField(
      controller: phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: '996500505050',
        hintStyle: AppTextStyles.hintStyle,
      ),
      validator: (phoneForValidate) => validateMobile(phoneForValidate!),
    );
  }
}
