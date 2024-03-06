import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/constants/api_constants.dart';
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
    var areaFirstList=CompanyInfo(context: context).areaCompanyFirst();
    var areaSecondList=CompanyInfo(context: context).areaCompanySecond();
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
                                businessTypeFieldTemplate((CompanyInfo(context: context).getBusinessTypeList(testInfo!.testNo))),
                                SizedBox(height: 16.h),
                                staffAmounFieldTemplate(CompanyInfo(context: context).getStaffAmountList()),
                                SizedBox(height: 16.h),
                                businessDurationFieldTemplate(CompanyInfo(context: context).getBusinessDurationList()),
                                SizedBox(height: 16.h),
                                textEditingFieldTemplate(hintText: context.text.additionalCompanyInfo),
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
                                      areaCompany: testInfo!.testNo < 3 ? (areaFirstList.indexOf(selectedLocation!)+1).toString() : (areaSecondList.indexOf(selectedLocation!)+4).toString(),
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
                                  hintText: context.text.companyName),
                              SizedBox(height: 16.h),
                              nameFieldTemplate(
                                  hintText: context.text.ceoName),
                              SizedBox(height: 16.h),
                              regionFieldTemplate(hintText: context.text.region),
                              SizedBox(height: 16.h),
                              phoneFieldTemplate(hintText: phoneTemp),
                              SizedBox(height: 16.h),
                              dropDownFieldTemplate(testInfo!.testNo <3 ? areaFirstList : areaSecondList)
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
        hintText: context.text.businessArea,
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
      validator: (area) => area==null ? context.text.selectArea : null,
    );
  }

  companyFieldTemplate({required String hintText}) {
    return TextFormField(
      controller: companyNameController,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
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
      company!.length > 3 ? null : context.text.enterCompanyName,
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
        hintText: context.text.businessType,
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
      validator: (area) => area==null ? context.text.selectBusinessType : null,
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
        hintText: context.text.numberOfEmployees,
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
      validator: (area) => area==null ? context.text.selectNumberOfEmployees : null,
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
        hintText: context.text.businessExperience,
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
      validator: (area) => area==null ? context.text.selectBusinessExperience : null,
    );
  }

  textEditingFieldTemplate({required String hintText}) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      onFieldSubmitted: (s){
        /*if (_formKey.currentState!.validate()) {
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
        }*/
      },

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
      textCapitalization: TextCapitalization.words,
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
      nameDirector!.length > 0 ? null : context.text.enterDirectorName,
    );
  }

  phoneFieldTemplate({required String hintText}) {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      inputFormatters: [maskFormatter],
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
      textCapitalization: TextCapitalization.words,
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
      regionForValidate!.length > 0 ? null : context.text.enterRegion,
    );
  }
}

