import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/audit_test_consult_feature/domain/entities/audit_consult_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/servise_locator/servise_locator.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../../widgets/progressWidget.dart';
import '../../domain/entities/audit_test_list_entity.dart';
import '../bloc/audit_bloc/audit_bloc.dart';
import '../bloc/audit_consult_accept/accept_audit_consult_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditConsultationScreen extends StatelessWidget {
  const AuditConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.consultations),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100.w,
      ),
      body: BlocBuilder<AuditBloc, AuditState>(
        bloc: BlocProvider.of<AuditBloc>(context)
          ..add(const AuditConsultListEvent()),
        builder: (context, state) {
          if (state is LoadingAuditState) {
            return Center(child: progressWidget());
          }
          if(state is LoadedAuditConsultListState){
            return state.auditConsultList.isNotEmpty ? ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32).r,
              children: [
                for(var item in state.auditConsultList)
                  buildAuditTestItem(item,context,getIt<AcceptAuditConsultBloc>()),
                  /*Column(children:[
                    *//*state.acceptList.contains(item.id!.toString()) ?
            buildAcceptedItem(item.participant!,item.userEmail!,item.region!,item.phone!):*//*

                    ])*/
              ],
            ) :
                Center(child: Text('No product'));
          }
          return const SizedBox();
        },
      ),
    );
  }

  space(){
    return SizedBox(height: 22.h);
  }
  buildAuditTestItem(AuditConsult consult,BuildContext context,AcceptAuditConsultBloc myBloc){
    print('we here ${consult.auditorId.toString()}');
    return Column(
      children: [
        BlocBuilder<AcceptAuditConsultBloc, AcceptAuditConsultState>(
          bloc: myBloc..add(CheckConsultAcceptEvent(auditId: consult.auditorId.toString() ?? '')),
          builder: (context, state) {
            if (state is LoadingAcceptAuditConsultState) {
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
            if(state is AcceptedAuditConsultState){
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
                          child: Text(consult.userCompany ?? 'Нету',
                              style: AppTextStyles.clearSansMediumS14W500C009D9B),
                        ),
                        Flexible(
                          child: SizedBox(
                            child: Row(
                              children: [
                                Image.asset('assets/icon/sms.png',width: 18.w,height: 18.h),
                                SizedBox(width: 6.w),
                                Flexible(child: Text(consult.userEmail!,style: AppTextStyles.clearSansS12W400CBlack,)),
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
                                Text(consult.userRegion ?? 'Нету',
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
                                Text(consult.userPhone ?? 'Нету',
                                    style: AppTextStyles.clearSansS12W400CBlack),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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

            if(state is NewAuditConsultState){
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(consult.userCompany ?? 'Нету',
                            style: AppTextStyles.clearSansMediumS14W500C009D9B),
                        SizedBox(height: 6.h),
                        SizedBox(
                          child: Row(
                            children: [
                              Image.asset('assets/icon/location.png',width: 18.w,height: 18.h),
                              SizedBox(width: 6.h),
                              Text(consult.userRegion ?? 'Нету',
                                  style: AppTextStyles.clearSansS12C82F400),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                                myBloc.add(
                                    OnTapConfirmEvent(auditTestId: consult.id.toString()));

                            },
                            child: Container(
                              width: 82.w,
                              height: 22.h,
                              decoration: BoxDecoration(
                                  color: AppColors.color009D9B,
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: Center(child: Text('Принять',style: AppTextStyles.clearSansMediumS12W500CWhite)),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          InkWell(
                            onTap: (){
                              /*myBloc.add(
                                  OnTapConsultAcceptEvent(auditTestId: auditTest.id.toString()));*/
                              myBloc.add(
                                  OnTapDenyConsultEvent(consultId: consult.id.toString()));
                            },
                            child: Container(
                              width: 82.w,
                              height: 22.h,
                              decoration: BoxDecoration(
                                  color: AppColors.colorFF0000,
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: Center(child: Text('Отклонить',style: AppTextStyles.clearSansMediumS12W500CWhite,)),
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
        ),
        // space()
      ],
    );
  }
  buildConsultationItem(String title,String email,String location,String phone){
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.clearSansMediumS14W500C009D9B),
                SizedBox(height: 6.h),
                SizedBox(
                  child: Row(
                    children: [
                      Image.asset('assets/icon/location.png',width: 18.w,height: 18.h),
                      SizedBox(width: 6.w),
                      Text(location,
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
                      Text(email,style: AppTextStyles.clearSansS12W400CBlack,),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  child: Row(
                    children: [
                      Image.asset('assets/icon/call.png',width: 18.w,height: 18.h),
                      SizedBox(width: 6.w),
                      Text(phone,
                          style: AppTextStyles.clearSansS12C82F400),
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
}
