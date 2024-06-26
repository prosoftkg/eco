import 'package:eco_kg/core/constants/api_constants.dart';
import 'package:eco_kg/feature/get_certificate/presentation/bloc/get_data_from_get_certificate_bloc.dart';
import 'package:eco_kg/feature/get_certificate/presentation/get_certificate_screen.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/getCertificateInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/paymentInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/presentation/info_form_for_payment/bloc/get_certificate_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/auto_route/auto_route.dart';
import '../../../../core/servise_locator/servise_locator.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/utils/user.dart';
import '../../../../core/utils/utils.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth_feature/presentation/widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../consultation_feature/presentation/consultation_screen.dart';
import '../../../test_feature/domain/entities/company_info_entity.dart';
import '../../../widgets/progressWidget.dart';
import 'bloc/get_certificate_bloc.dart';

final _formKey = GlobalKey<FormState>();

class InfoFormCertificateForPayment extends StatefulWidget {
  const InfoFormCertificateForPayment({super.key});

  @override
  State<InfoFormCertificateForPayment> createState() =>
      _InfoFormCertificateForPaymentState();
}

class _InfoFormCertificateForPaymentState
    extends State<InfoFormCertificateForPayment> {
  TextEditingController companyNameController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController regionController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController textEditingController = TextEditingController();
  
  int? typeBusiness;
  int? staffAmount;
  int? businessDuration;

  int? testNo;
  String? selectedCompanyArea;
  String? selectedCategory;

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
  var companyAreaId;

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = [
      context.text.test1,
      context.text.test2,
      context.text.test3,
      context.text.test4
    ];

    var areaFirstList=CompanyInfo(context: context).areaCompanyFirst();
    var areaSecondList=CompanyInfo(context: context).areaCompanySecond();

    var myBloc = getIt<GetCertificateBloc>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                AutoRouter.of(context).pop();
              },
              child: appBarLeading(context)),
          leadingWidth: UserData.sizeScreen ? 100.w : 100,
        ),
        body: BlocBuilder<GetCertificateBloc, GetCertificateState>(
          bloc: myBloc,
          builder: (context, state) {
            if (state is LoadingGetCertificateState) {
              return Center(child: progressWidget());
            }
            if (state is LoadedGetCertificateState) {
              PaymentInfoEntity paymentInfo = PaymentInfoEntity(
                  testId: '0',
                  paymentType: '1',
                  sum: sumCertificate(testNo.toString(), companyAreaId),
                  categoryId: testNo.toString(),
                  companyName: companyNameController.text,
                  companyDirector: fullNameController.text,
                  region: regionController.text,
                  phone: phoneController.text,
                  area: companyAreaId);
              BlocProvider.of<GetDataFromGetCertificateBloc>(context).add(
                  LoadGetDataFromGetCertificate(
                      paymentInfoEntity: paymentInfo));
              AutoRouter.of(context)
                  .replace(PaymentGetCertificateRoute());
              return Center(child: progressWidget());
              // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>GetCertificatScreen(testId: '0',sum: sumConsult(testNo.toString(), companyAreaId),)));
            }
            if(state is LoadNextGetCertificateState){
              return Padding(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: UserData.sizeHeight ? 32.h : 16, bottom: UserData.sizeHeight ? 124.h : 70)
                    .r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 40.h),
                              businessTypeFieldTemplate((CompanyInfo(context: context).getBusinessTypeList(testNo!))),
                              SizedBox(height: 16.h),
                              staffAmounFieldTemplate(CompanyInfo(context: context).getStaffAmountList()),
                              SizedBox(height: 16.h),
                              businessDurationFieldTemplate(CompanyInfo(context: context).getBusinessDurationList()),
                              SizedBox(height: 16.h),
                              textEditingFieldTemplate(hintText: context.text.additionalCompanyInfo,blocTemp: myBloc),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                UserData.name = fullNameController.text;
                                UserData.companyName = companyNameController.text;
                                UserData.phone = phoneController.text;
                                UserData.region = regionController.text;
                                companyAreaId = testNo! < 3
                                    ? (areaFirstList
                                    .indexOf(selectedCompanyArea!) +
                                    1)
                                    .toString()
                                    : (areaSecondList
                                    .indexOf(selectedCompanyArea!) +
                                    4)
                                    .toString();
                                myBloc.add(LoadGetCertificateEvent(
                                    getCertificateInfoEntity:
                                    GetCertificateInfoEntity(
                                      categoryId: testNo.toString(),
                                      area: companyAreaId,
                                      companyDirector: fullNameController.text,
                                      companyName: companyNameController.text,
                                      paymentType: '1',
                                      phone: phoneController.text,
                                      region: regionController.text,
                                      testId: '0',
                                        businessDuration: businessDuration.toString(),
                                        businessType: typeBusiness.toString(),staffAmount: staffAmount.toString(),
                                        textCompany: textEditingController.text
                                    )));
                                /*var tempTestInfo = TestInfoForBegin(
                            companyName: companyNameController.text,
                            companyDirector:
                            fullNameController.text,
                            categoryId: testInfo!.testNo.toString(),
                            region: regionController.text,
                            phone: phoneController.text,
                            testType: 'userType',
                            areaCompany: testInfo!.testNo < 3 ? (UserData.areaCompanyFirst.indexOf(selectedLocation!)+1).toString() : (UserData.areaCompanySecond.indexOf(selectedLocation!)+4).toString());*/
                                /*BlocProvider.of<TestBloc>(context).add(
                            BeginTestEvent(
                                testInfoForBegin: tempTestInfo));*/
                              }
                            },
                            child: button(text: context.text.getResults))
                  ],
                ),
              );
            }
    return Padding(
          padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: UserData.sizeHeight ? 32.h : 16, bottom: UserData.sizeHeight ? 124.h : 70)
              .r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        categoryDropDownTemplate(categoryList),
                        SizedBox(height: 16.h),
                        companyFieldTemplate(hintText: context.text.companyName),
                        SizedBox(height: 16.h),
                        nameFieldTemplate(
                            hintText: context.text.ceoName),
                        SizedBox(height: 16.h),
                        regionFieldTemplate(hintText: context.text.region),
                        SizedBox(height: 16.h),
                        phoneFieldTemplate(hintText: phoneTemp),
                        SizedBox(height: 16.h),
                        testNo != null
                            ? dropDownFieldTemplate(testNo! < 3
                                ? areaFirstList
                                : areaSecondList)
                            : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          UserData.name = fullNameController.text;
                          UserData.companyName = companyNameController.text;
                          UserData.phone = phoneController.text;
                          UserData.region = regionController.text;
                          companyAreaId = testNo! < 3
                              ? (areaFirstList
                                          .indexOf(selectedCompanyArea!) +
                                      1)
                                  .toString()
                              : (areaSecondList
                                          .indexOf(selectedCompanyArea!) +
                                      4)
                                  .toString();
                          myBloc.add(LoadNextGetCertificateEvent());
                          /*var tempTestInfo = TestInfoForBegin(
                            companyName: companyNameController.text,
                            companyDirector:
                            fullNameController.text,
                            categoryId: testInfo!.testNo.toString(),
                            region: regionController.text,
                            phone: phoneController.text,
                            testType: 'userType',
                            areaCompany: testInfo!.testNo < 3 ? (UserData.areaCompanyFirst.indexOf(selectedLocation!)+1).toString() : (UserData.areaCompanySecond.indexOf(selectedLocation!)+4).toString());*/
                          /*BlocProvider.of<TestBloc>(context).add(
                            BeginTestEvent(
                                testInfoForBegin: tempTestInfo));*/
                        }
                      },
                      child: button(text: context.text.next))
            ],
          ),
        );
  },
));
  }

  companyFieldTemplate({required String hintText}) {
    return TextFormField(
      style: AppTextStyles.controllerStyle,
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
      value: selectedCompanyArea,
      items: dropDownList
          .map((String e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedCompanyArea = value!;
        });
      },
      validator: (area) => area == null ? context.text.selectArea : null,
    );
  }

  categoryDropDownTemplate(List<String> dropDownList) {
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
        hintText: context.text.selectCategory,
        hintStyle: AppTextStyles.hintStyle,
      ),
      dropdownColor: AppColors.colorWhite,
      value: selectedCategory,
      items: dropDownList
          .map((String e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedCategory = value!;
          selectedCompanyArea = null;
          testNo = dropDownList.indexOf(value) + 1;
        });
      },
      validator: (area) => area == null ? context.text.selectCategory : null,
    );
  }

  nameFieldTemplate({required String hintText}) {
    return TextFormField(
      style: AppTextStyles.controllerStyle,
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
      style: AppTextStyles.controllerStyle,
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
      style: AppTextStyles.controllerStyle,
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
        typeBusiness = value!;
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
        staffAmount = value!;
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
        businessDuration = value!;
      },
      validator: (area) => area==null ? context.text.selectBusinessExperience : null,
    );
  }

  textEditingFieldTemplate({required String hintText,required var blocTemp}) {
    return TextFormField(
      style: AppTextStyles.controllerStyle,
      onFieldSubmitted: (s){
       /* if (_formKey.currentState!.validate()) {
          UserData.name = fullNameController.text;
          UserData.companyName = companyNameController.text;
          UserData.phone = phoneController.text;
          UserData.region = regionController.text;
          companyAreaId = testNo! < 3
              ? (UserData.areaCompanyFirst
              .indexOf(selectedCompanyArea!) +
              1)
              .toString()
              : (UserData.areaCompanySecond
              .indexOf(selectedCompanyArea!) +
              4)
              .toString();
          blocTemp.add(LoadGetCertificateEvent(
              getCertificateInfoEntity:
              GetCertificateInfoEntity(
                  categoryId: testNo.toString(),
                  area: companyAreaId,
                  companyDirector: fullNameController.text,
                  companyName: companyNameController.text,
                  paymentType: '1',
                  phone: phoneController.text,
                  region: regionController.text,
                  testId: '0',
                  businessDuration: businessDuration.toString(),
                  businessType: typeBusiness.toString(),staffAmount: staffAmount.toString(),
                  textCompany: textEditingController.text
              )));
          *//*var tempTestInfo = TestInfoForBegin(
                            companyName: companyNameController.text,
                            companyDirector:
                            fullNameController.text,
                            categoryId: testInfo!.testNo.toString(),
                            region: regionController.text,
                            phone: phoneController.text,
                            testType: 'userType',
                            areaCompany: testInfo!.testNo < 3 ? (UserData.areaCompanyFirst.indexOf(selectedLocation!)+1).toString() : (UserData.areaCompanySecond.indexOf(selectedLocation!)+4).toString());*//*
          *//*BlocProvider.of<TestBloc>(context).add(
                            BeginTestEvent(
                                testInfoForBegin: tempTestInfo));*//*
        }*/
      },

      controller: textEditingController,
      textCapitalization: TextCapitalization.sentences,
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
}
