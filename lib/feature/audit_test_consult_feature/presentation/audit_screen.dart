import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/auto_route/auto_route.dart';
import '../../../core/servise_locator/servise_locator.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';
import '../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../test_feature/domain/entities/testIngoForBegin.dart';
import '../../test_feature/presentation/bloc/test_bloc.dart';
import '../../widgets/progressWidget.dart';
import '../domain/entities/audit_test_list_entity.dart';
import 'bloc/audit_accept_bloc/accept_audit_test_bloc.dart';
import 'bloc/audit_bloc/audit_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';

class AuditScreen extends StatelessWidget {
  const AuditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.audit),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100.w,
      ),
      body: BlocBuilder<AuditBloc, AuditState>(
        bloc: BlocProvider.of<AuditBloc>(context)
            ..add(const AuditTestListEvent()),
  builder: (context, state) {
    if (state is LoadingAuditState) {
      return Center(child: progressWidget());
    }
    if(state is LoadedAuditTestListState){
      return state.auditTestList.isNotEmpty ? ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32).r,
        children: [
          for(var item in state.auditTestList)
          buildAuditTestItem(item,context,getIt<AcceptAuditTestBloc>(),getIt<TestBloc>())
        ],
      ) : const Center(child: Text('No product'));
    }
    return const SizedBox();
  },
),
    );
  }
  space(){
    return SizedBox(height: 22.h);
  }
  buildAuditTestItem(AuditTest auditTest,BuildContext context,AcceptAuditTestBloc myBloc,TestBloc testBloc){
    return BlocBuilder<AcceptAuditTestBloc, AcceptAuditTestState>(
      bloc: myBloc..add(CheckAcceptEvent(auditId: auditTest.auditorId.toString())),
      builder: (context, state) {
        if (state is LoadingAcceptAuditTestState) {
    return Container(
        margin: EdgeInsets.only(bottom: 22).r,
        padding: const EdgeInsets.all(16).r,
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 28,
              color: AppColors.color009D9B.withOpacity(0.08),
              offset: const Offset(0, 12),
            ),
          ],
        ),
    child: Center(child: progressWidget()));
        }

        /*if(state is LoadedDenyAuditTestState){
    BlocProvider.of<AuditBloc>(context)
      ..add(const AuditTestListEvent());
        }*/

        if(state is AcceptedAuditTestState){
    return Container(
      margin: EdgeInsets.only(bottom: 22).r,
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 28,
            color: AppColors.color009D9B.withOpacity(0.08),
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(auditTest.userCompany!,
                    style: AppTextStyles.clearSansMediumS14W500C009D9B),
              ),
              Flexible(
                child: SizedBox(
                  child: Row(
                    children: [
                      Image.asset('assets/icon/sms.png',width: 18.w,height: 18.h),
                      SizedBox(width: 6.w),
                      Flexible(child: Text(auditTest.userEmail!,style: AppTextStyles.clearSansS12W400CBlack,)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  child: Row(
                    children: [
                      Image.asset('assets/icon/location.png',width: 18.w,height: 18.h),
                      SizedBox(width: 6.w),
                      Text(auditTest.userRegion!,
                          style: AppTextStyles.clearSansS12C82F400),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  child: Row(
                    children: [
                      Image.asset('assets/icon/call.png',width: 18.w,height: 18.h),
                      SizedBox(width: 6.w),
                      Text(auditTest.userPhone != '' ? auditTest.userPhone! : 'Нету',
                          style: AppTextStyles.clearSansS12W400CBlack),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          BlocBuilder<TestBloc, TestState>(
            bloc: testBloc,
          builder: (context, state) {
            if (state is LoadingTestState) {
              return Center(child: progressWidget());
            }
            if (state is LoadedTestState) {

              AutoRouter.of(context).push(const StartTestRoute());
              BlocProvider.of<TestBloc>(context)
                .add(GlobalAuditTestEvent(
                    testEntity: state.testEntity,
                    categoryId: state.categoryId
                ),);
            }
            if (state is ErrorTestState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return InkWell(
                    onTap: (){
                      testBloc.add(
                        BeginAuditTestEvent(
                            categoryId: auditTest.categoryId.toString(),
                            testId: auditTest.id.toString(),
                          ),
                      );
                      /*BlocProvider.of<TestBloc>(context)
                        ..add(BeginAuditTestEvent(
                          testInfoForBegin: TestInfoForBegin(
                            companyName: auditTest.participant!,
                            companyDirector: auditTest.companyDirector!,
                            categoryId: auditTest.categoryId.toString(),
                            region: auditTest.region!,
                            phone: auditTest.phone!,
                          ), testId: auditTest.id.toString(),
                        ),);*/
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 9).r,
                      decoration: const BoxDecoration(
                          color: AppColors.color009D9B,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icon/card-edit.png', height: 24.h, width: 24.w),
                          SizedBox(width: 10.w),
                          Text(context.text.begin_test,style: AppTextStyles.buttonTextStyle)
                        ],
                      ),
                    ),
                  );
          },
          )
        ],
      ),
    );

      /*Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(auditTest.participant!,
                  style: AppTextStyles.clearSansMediumS14W500C009D9B),
              SizedBox(height: 6.h),
              SizedBox(
                child: Row(
                  children: [
                    Image.asset('assets/icon/location.png',width: 18.w,height: 18.h),
                    SizedBox(width: 6.w),
                    Text(auditTest.region!,
                        style: AppTextStyles.clearSansS12C82F400),
                  ],
                ),
              )
            ],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Image.asset('assets/icon/sms.png',width: 18.w,height: 18.h),
                    SizedBox(width: 6.w),
                    Flexible(child: Text(auditTest.userEmail!,style: AppTextStyles.clearSansS12W400CBlack,)),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              SizedBox(
                child: Row(
                  children: [
                    Image.asset('assets/icon/call.png',width: 18.w,height: 18.h),
                    SizedBox(width: 6.w),
                    Text(auditTest.phone != '' ? auditTest.phone! : 'Нету',
                        style: AppTextStyles.clearSansS12W400CBlack),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );*/
        }

        if(state is NewAuditTestState){
    return Container(
      margin: EdgeInsets.only(bottom: 22).r,
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 28,
            color: AppColors.color009D9B.withOpacity(0.08),
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(auditTest.userCompany!,
              style: AppTextStyles.clearSansMediumS14W500C009D9B),
          SizedBox(height: 6.h),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SizedBox(
                    child: Row(
                      children: [
                        Image.asset('assets/icon/location.png',width: 18.w,height: 18.h),
                        SizedBox(width: 6.h),
                        Expanded(
                          child: Text(auditTest.userRegion!,
                              style: AppTextStyles.clearSansS12C82F400),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          myBloc.add(
                              OnTapAcceptEvent(auditTestId: auditTest.id.toString()));
                        },
                        child: Container(
                          width: 82.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                              color: AppColors.color009D9B,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Center(child: Text(context.text.apply,style: AppTextStyles.clearSansMediumS12W500CWhite)),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      InkWell(
                        onTap: (){
                          myBloc.add(
                              OnTapDenyEvent(auditTestId: auditTest.id.toString()));
                        },
                        child: Container(
                          width: 82.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                              color: AppColors.colorFF0000,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Center(child: Text(context.text.deny,style: AppTextStyles.clearSansMediumS12W500CWhite,)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
        }

        return const SizedBox();
      },
    );
  }
}
