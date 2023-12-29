import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/utils/user.dart';
import '../../../../core/utils/utils.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth_feature/presentation/widgets/button.dart';
import '../../../consultation_feature/presentation/consultation_screen.dart';


final _formKey = GlobalKey<FormState>();

class InfoFormForPayment extends StatefulWidget {
  const InfoFormForPayment({super.key});


  @override
  State<InfoFormForPayment> createState() => _InfoFormForPaymentState();
}

class _InfoFormForPaymentState extends State<InfoFormForPayment> {
  TextEditingController companyNameController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController regionController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

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


  @override
  Widget build(BuildContext context) {
    List<String> categoryList=[
      context.text.test1,
      context.text.test2,
      context.text.test3,
      context.text.test4
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100.w,
      ),
      body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height.h - 32.h,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 32, bottom: 124)
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
                              testNo!=null ? dropDownFieldTemplate(testNo! < 3 ? UserData.areaCompanyFirst : UserData.areaCompanySecond) : SizedBox(),
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
                                var companyAreaId=testNo! < 3 ? (UserData.areaCompanyFirst.indexOf(selectedCompanyArea!)+1).toString() : (UserData.areaCompanySecond.indexOf(selectedCompanyArea!)+4).toString();
                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ConsultationScreen(testId: '0',sum: sumConsult(testNo.toString(), companyAreaId),)));
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
                            child: button(text: 'Получить')),
                  ],
                ),
              ),
            ),
          )
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
      validator: (area) => area==null ? 'Выберите площадь' : null,
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
        hintText: 'Выберите категорию',
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
          selectedCompanyArea=null;
          testNo=dropDownList.indexOf(value)+1;
        });
      },
      validator: (area) => area==null ? 'Выберите категорию' : null,
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
