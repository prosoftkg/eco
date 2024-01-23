import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForNext.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:flutter/material.dart';
import '../../../../core/auto_route/auto_route.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/utils/alertDialog.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../../home_feature/widget/bottom_background_image.dart';
import '../../../splash_feature/presentation/bloc/language_bloc.dart';
import '../../../widgets/progressWidget.dart';
import '../bloc/test_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({super.key});

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  TextEditingController name = TextEditingController();

  int? numberofPages;
  int? currentPage;
  String currentOption = '';
  String currentOptionId = '';
  var answers;
  String? categoryId = '';
  String company_area='';
  String? question = '';
  String? testId = '';
  String? mId = '';
  String? testType='';
  var lan = '';
  Set<String> id_arr={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.text.test,
          style: AppTextStyles.clearSansMediumTextStyle16,
        ),
        leading: InkWell(
            onTap: () {
              var dialog = CustomAlertDialog(
                  title: context.text.logout_from_test,
                  message: context.text.logout_from_test_message,
                  onPostivePressed: () {
                    AutoRouter.of(context).replaceAll([HomeRoute()]);
                  },
                  positiveBtnText: context.text.yes,
                  negativeBtnText: context.text.no, onNegativePressed: (){});
              showDialog(
                  context: context,
                  builder: (BuildContext context) => dialog);
              // AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100.w,
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
  builder: (context, stateLan) {
    return BlocBuilder<TestBloc, TestState>(
        builder: (context, state) {
          if (state is LoadingTestState) {
            return Center(child: progressWidget());
          }
          if (state is LoadedTestState) {
            print(state.testEntity.testId);
            if (stateLan.lanCode != 'ru') {
              lan = stateLan.lanCode;
            }
            id_arr.add(state.testEntity.mid.toString());
            numberofPages = int.parse(state.testEntity.count!);
            answers = state.testEntity.answer;
            question = lan == ''
                ? state.testEntity.question!
                : lan == 'en'
                ? (state.testEntity.questionEn=='' ? state.testEntity.question! : state.testEntity.questionEn)
                : (state.testEntity.questionKy=='' ? state.testEntity.question! : state.testEntity.questionKy);
            categoryId = state.categoryId;
            testType=state.testType;
            testId = state.testEntity.testId.toString();
            mId = state.testEntity.mid.toString();
            currentPage = state.testEntity.number;
            company_area=state.companyArea;
          }
          if (state is LoadedNextTestState) {
            if (stateLan.lanCode != 'ru') {
              lan = stateLan.lanCode;
            }
            id_arr.add(state.nextTestEntity.mid.toString());
            question = lan == ''
                ? state.nextTestEntity.question!
                : lan == 'en'
                ? (state.nextTestEntity.questionEn=='' ? state.nextTestEntity.question! : state.nextTestEntity.questionEn)
                : (state.nextTestEntity.questionKy=='' ? state.nextTestEntity.question! : state.nextTestEntity.questionKy);

            answers = state.nextTestEntity.answer;
            mId = state.nextTestEntity.mid.toString();
            currentPage = state.nextTestEntity.number;
          }
          if(state is LoadedResultTestState){
            AutoRouter.of(context).replace(const FinishTestRoute());
          }
          if(state is LoadedFinishTestState){
            BlocProvider.of<TestBloc>(context)
                .add(ResultTestEvent(finishTestEntity: state.finishTestEntity,testId: state.testId,tetsType: testType!,companyArea: company_area,categoryId: categoryId!));
          }
          if(state is ErrorTestState){
            return Stack(
              children: [
                Center(child: Text(state.error.toString())),
                bottomBackgroungImage(context)
              ],
            );
          }
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(32).r,
                child: NumberPaginator(
                  initialPage: currentPage!-1,
                  showPrevButton: false,
                  showNextButton: false,
                  numberPages: numberofPages!,
                  config: const NumberPaginatorUIConfig(
                    contentPadding: EdgeInsets.all(0),
                    buttonSelectedBackgroundColor: AppColors.color009D9B,
                    buttonUnselectedBackgroundColor: AppColors.colorD4D4D4,
                    buttonSelectedForegroundColor: AppColors.colorWhite,
                    buttonUnselectedForegroundColor: AppColors.colorWhite,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 96,bottom: 210).r,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: [
                    SizedBox(height: 13.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(question!,
                            style: AppTextStyles.clearSansMediumTextStyle16),
                        SizedBox(height: 16.h),
                        for (var item in answers!)
                          RadioListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: Text(lan == ''
                                  ? item.title!
                                  : lan == 'en'
                                  ? item.titleEn ?? item.title!
                                  : item.titleKy ?? item.title!
                                ,
                                style: AppTextStyles.clearSansS14CBlackF400,
                              ),
                              value: item.title,
                              groupValue: currentOption,
                              onChanged: (value) {
                                currentOption = value.toString();
                                currentOptionId = item.id.toString();
                                setState(() {});
                              },
                              activeColor: AppColors.color009D9B,
                              hoverColor: AppColors.colorEAFEF1),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 90.h,
                  left: 16.h,
                  child: InkWell(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        child: currentPage==numberofPages?button(text: context.text.finish):button(text: context.text.next)),
                    onTap: () {
                      if (currentOptionId != '') {
                        print(id_arr.toString() +' id_arr');
                        var tempTestInfo = TestInfoForNext(
                            test_id: testId!,
                            question_id: mId!,
                            answer_id: currentOptionId,
                            category_id: categoryId!,
                            number: currentPage.toString(),
                          testType: testType!,
                          id_arr: id_arr.toList()
                        );
                        currentOptionId='';
                        currentOption='';
                        currentPage!=numberofPages ? BlocProvider.of<TestBloc>(context).add(
                            NextTestEvent(testInfoForNext: tempTestInfo)) :
                        BlocProvider.of<TestBloc>(context).add(
                            FinishTestEvent(testInfoForNext: tempTestInfo));
                      }
                    },
                  )),
              bottomBackgroungImage(context)
            ],
          );
        },
      );
  },
),
    );
  }
}
