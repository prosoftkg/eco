import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/servise_locator/servise_locator.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_kg/core/utils/errorInfo.dart';
import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/company_info_entity.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userData.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:flutter/material.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/utils/showDialog.dart';
import '../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../home_feature/domain/entities/test.dart';
import '../../home_feature/widget/bottom_background_image.dart';
import '../../home_feature/widget/testIcon.dart';
import '../../user_cabinet_feature/presentation/bloc/userDataBloc/user_data_bloc.dart';
import '../../widgets/progressWidget.dart';
import 'bloc/test_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _formKey = GlobalKey<FormState>();

class MainTestScreen extends StatefulWidget {
  MainTestScreen({super.key});

  @override
  State<MainTestScreen> createState() => _MainTestScreenState();
}

class _MainTestScreenState extends State<MainTestScreen> {
  TextEditingController companyNameController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController regionController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  Test? testInfo;

  String? selectedLocation;
  TextEditingController textEditingController = TextEditingController();
  int? typeBusiness;
  int? staffAmount;
  int? businessDuration;

  TestInfoForBegin? testInfoForBegin;

  @override
  void dispose() {
    // TODO: implement dispose
    companyNameController.dispose();
    fullNameController.dispose();
    regionController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    companyNameController.text = UserData.companyName ?? '';
    fullNameController.text = UserData.name ?? '';
    regionController.text = UserData.region ?? '';
    phoneController.text = UserData.phone ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              context.text.test,
              style: AppTextStyles.clearSansMediumTextStyle16,
            ),
            automaticallyImplyLeading: false,
            leading: InkWell(
                onTap: () {
                  AutoRouter.of(context).pop();
                },
                child: appBarLeading(context)),
            leadingWidth: 100.w,
          ),
          body: BlocBuilder<TestBloc, TestState>(
            builder: (context, stateGlobal) {
              if (stateGlobal is LoadedInfoTestState) {
                testInfo = stateGlobal.infoTest;
              }
              if (stateGlobal is LoadingTestState) {
                return Center(child: progressWidget());
              }
              if(stateGlobal is ErrorTestState){
                return errorWidget(context);
              }
              if(stateGlobal is LoadCompanyInfoState){
                return Padding(
                  padding:  EdgeInsets.only(
                      left: 16.0.w, right: 16.0.w, top: 32.h, bottom: 124.h)
                      .r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              testIconWidget(
                                  testInfo!.backColor, testInfo!.iconPath),
                              SizedBox(width: 16.w),
                              Flexible(
                                child: SizedBox(
                                    child: Text(testInfo!.testTitle,
                                        style: AppTextStyles
                                            .clearSansMediumTextStyle18)),
                              ),
                            ],
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: 40.h),
                                businessTypeFieldTemplate((CompanyInfo().getBusinessTypeList(testInfo!.testNo))),
                                SizedBox(height: 16.h),
                                staffAmounFieldTemplate(CompanyInfo().getStaffAmountList()),
                                SizedBox(height: 16.h),
                                businessDurationFieldTemplate(CompanyInfo().getBusinessDurationList()),
                                SizedBox(height: 16.h),
                                textEditingFieldTemplate(hintText: 'Доп. инфо о компании'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  UserData.name = fullNameController.text;
                                  UserData.companyName =
                                      companyNameController.text;
                                  UserData.phone = phoneController.text;
                                  UserData.region = regionController.text;
                                  testInfoForBegin = TestInfoForBegin(
                                      companyName: companyNameController.text,
                                      companyDirector:
                                      fullNameController.text,
                                      categoryId: testInfo!.testNo.toString(),
                                      region: regionController.text,
                                      phone: phoneController.text,
                                      testType: 'userType',
                                      areaCompany: testInfo!.testNo < 3 ? (UserData.areaCompanyFirst.indexOf(selectedLocation!)+1).toString() : (UserData.areaCompanySecond.indexOf(selectedLocation!)+4).toString(),
                                    businessDuration: businessDuration.toString(),
                                    businessType: typeBusiness.toString(),staffAmount: staffAmount.toString(),
                                    textCompany: textEditingController.text
                                  );
                                  BlocProvider.of<TestBloc>(context).add(
                                      BeginTestEvent(testInfoForBegin: testInfoForBegin!));
                                }
                              },
                              child: button(text: context.text.begin))
                    ],
                  ),
                );
              }
              if(stateGlobal is LoadedTestState){
                BlocProvider.of<UserDataBloc>(context).add(
                  ChangeUserDataEvent(
                      userDataForEdit: UserDataForEdit(
                          name: fullNameController.text,
                          phone: phoneController.text)),
                );
                AutoRouter.of(context)
                    .replace(const StartTestRoute());
                return Center(child: progressWidget());
              }
              return Padding(
                padding:  EdgeInsets.only(
                    left: 16.0.w, right: 16.0.w, top: 32.h, bottom: 124.h)
                    .r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            testIconWidget(
                                testInfo!.backColor, testInfo!.iconPath),
                            SizedBox(width: 16.w),
                            Flexible(
                              child: SizedBox(
                                  child: Text(testInfo!.testTitle,
                                      style: AppTextStyles
                                          .clearSansMediumTextStyle18)),
                            ),
                          ],
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 40.h),
                              companyFieldTemplate(
                                  hintText: 'Название предприятия'),
                              SizedBox(height: 16.h),
                              nameFieldTemplate(
                                  hintText: 'Руководитель компании ФИО'),
                              SizedBox(height: 16.h),
                              regionFieldTemplate(hintText: 'Регион'),
                              SizedBox(height: 16.h),
                              phoneFieldTemplate(hintText: '996700123456'),
                              SizedBox(height: 16.h),
                              dropDownFieldTemplate(testInfo!.testNo <3 ? UserData.areaCompanyFirst : UserData.areaCompanySecond)
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                UserData.name = fullNameController.text;
                                UserData.companyName =
                                    companyNameController.text;
                                UserData.phone = phoneController.text;
                                UserData.region = regionController.text;
                                BlocProvider.of<TestBloc>(context).add(
                                    const CompanyInfoEvent());
                              }
                            },
                            child: button(text: context.text.next)),
                  ],
                ),
              );
            },
          ),
        ),
        bottomBackgroungImage(context),
      ],
    );
  }

  dropDownFieldTemplate(List<String> dropDownList) {
    return DropdownButtonFormField<String>(
      style: AppTextStyles.clearSansS16W400CBlack,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12).r,
        ),
        hintText: 'Площадь предприятия',
        hintStyle: AppTextStyles.hintStyle,
      ),
      dropdownColor: AppColors.colorWhite,
      value: selectedLocation,
      items: dropDownList
          .map((String e) => DropdownMenuItem<String>(
        value: e,
        child: Text(e),
      ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedLocation = value!;
        });
      },
      validator: (area) => area==null ? 'Выберите площадь' : null,
    );
  }

  companyFieldTemplate({required String hintText}) {
    return TextFormField(
      controller: companyNameController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.hintStyle,
      ),
      validator: (company) =>
      company!.length > 3 ? null : 'Введите название предприятия',
    );
  }

  businessTypeFieldTemplate(Map<int,String> dropDownList) {
    return DropdownButtonFormField<int>(
      style: AppTextStyles.clearSansS16W400CBlack,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12).r,
        ),
        hintText: 'Тип предприятия',
        hintStyle: AppTextStyles.hintStyle,
      ),
      dropdownColor: AppColors.colorWhite,
      value: typeBusiness,
      items: dropDownList.entries
          .map((MapEntry<int, String> entry) => DropdownMenuItem<int>(
        value: entry.key,
        child: Text(entry.value),
      ))
          .toList(),
      onChanged: (value) {
        setState(() {
          typeBusiness = value!;
        });
      },
      validator: (area) => area==null ? 'Выберите тип предприятия' : null,
    );
  }

  staffAmounFieldTemplate(Map<int,String> dropDownList) {
    return DropdownButtonFormField<int>(
      style: AppTextStyles.clearSansS16W400CBlack,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12).r,
        ),
        hintText: 'Количество наемных работников',
        hintStyle: AppTextStyles.hintStyle,
      ),
      dropdownColor: AppColors.colorWhite,
      value: staffAmount,
      items: dropDownList.entries
          .map((MapEntry<int, String> entry) => DropdownMenuItem<int>(
        value: entry.key,
        child: Text(entry.value),
      ))
          .toList(),
      onChanged: (value) {
        setState(() {
          staffAmount = value!;
        });
      },
      validator: (area) => area==null ? 'Выберите количество наемных работников' : null,
    );
  }

  businessDurationFieldTemplate(Map<int,String> dropDownList) {
    return DropdownButtonFormField<int>(
      style: AppTextStyles.clearSansS16W400CBlack,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12).r,
        ),
        hintText: 'Как давно работает бизнес?',
        hintStyle: AppTextStyles.hintStyle,
      ),
      dropdownColor: AppColors.colorWhite,
      value: businessDuration,
      items: dropDownList.entries
          .map((MapEntry<int, String> entry) => DropdownMenuItem<int>(
        value: entry.key,
        child: Text(entry.value),
      ))
          .toList(),
      onChanged: (value) {
        setState(() {
          businessDuration = value!;
        });
      },
      validator: (area) => area==null ? 'Выберите время работы бизнеса' : null,
    );
  }

  textEditingFieldTemplate({required String hintText}) {
    return TextFormField(
      maxLines: null,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.hintStyle,
      ),
      /*validator: (regionForValidate) =>
      regionForValidate!.length > 0 ? null : 'Введите ',*/
    );
  }

  nameFieldTemplate({required String hintText}) {
    return TextFormField(
      controller: fullNameController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.hintStyle,
      ),
      validator: (nameDirector) =>
      nameDirector!.length > 0 ? null : 'Введите имя директора',
    );
  }

  phoneFieldTemplate({required String hintText}) {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.hintStyle,
      ),
      validator: (phoneForValidate) => validateMobile(phoneForValidate!),
    );
  }

  regionFieldTemplate({required String hintText}) {
    return TextFormField(
      controller: regionController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorF7F7F7,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15).r,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.hintStyle,
      ),
      validator: (regionForValidate) =>
      regionForValidate!.length > 0 ? null : 'Введите регион',
    );
  }
}

