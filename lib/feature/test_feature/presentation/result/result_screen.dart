import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/consultation_feature/presentation/consultation_screen.dart';
import 'package:eco_kg/feature/get_certificate/presentation/bloc/get_data_from_get_certificate_bloc.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/paymentInfoEntity.dart';
import 'package:eco_kg/feature/splash_feature/presentation/widget/button_with_icon.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/finishTestEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/utils.dart';
import '../../../consultation_feature/presentation/bloc/get_data_from_get_consultation_bloc.dart';
import '../../../get_certificate/presentation/get_certificate_screen.dart';
import '../../../home_feature/widget/bottom_background_image.dart';
import '../bloc/test_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  FinishTestEntity? finishTestEntity;
  String email = '';
  String? testId;
  String? testType;
  String? categoryId;
  String? companyArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 62, bottom: 122)
                    .r,
            child: BlocBuilder<TestBloc, TestState>(
              builder: (context, state) {
                if (state is LoadedResultTestState) {
                  finishTestEntity = state.finishTestEntity;
                  email = state.email;
                  testId = state.testId;
                  testType = state.testType;
                  categoryId = state.catId;
                  companyArea = state.companyArea;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                            finishTestEntity!.score! > 57
                                ? 'assets/img/result_success.png'
                                : 'assets/img/result_bad.png',
                            height: 100.h,
                            width: 100.w),
                        SizedBox(height: 62.h),
                        Text(
                          testType == 'auditTest'
                              ? 'Балл заявителя: ${finishTestEntity!.score!}'
                              : 'Ваш балл: ${finishTestEntity!.score!}',
                          style: AppTextStyles.clearSansMediumS22W500CBlack,
                        ),
                      ],
                    ),
                    // SizedBox(height: 16.h),
                    Text(finishTestEntity!.achievment!,
                        style: AppTextStyles.clearSansS16cl82,
                        textAlign: TextAlign.center),
                    getCertificate(),
                    Column(
                      children: [
                        Text(
                            testType == 'auditTest'
                                ? 'Почта заявителя с результатами теста:'
                                : 'Ваша почта с результатами теста:',
                            style: AppTextStyles.clearSansS12C82F400,
                            textAlign: TextAlign.center),
                        Text(email,
                            style: AppTextStyles.clearSansS12C82F400,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    buttonNext(context, testType!)
                  ],
                );
              },
            ),
          ),
          bottomBackgroungImage(context)
        ],
      ),
    );
  }

  getCertificate() {
    if (finishTestEntity!.score! > 73 && finishTestEntity!.score! < 83) {
      return Column(
        children: [
          Image.asset('assets/icon/certificateGold.png',
              height: 100.h, width: 100.w),
        ],
      );
    } else if (finishTestEntity!.score! > 64 && finishTestEntity!.score! < 74) {
      return Column(
        children: [
          Image.asset('assets/icon/certificateSilver.png',
              height: 100.h, width: 100.w),
        ],
      );
    } else if (finishTestEntity!.score! > 57 && finishTestEntity!.score! < 65) {
      return Column(
        children: [
          Image.asset('assets/icon/certificateBronze.png',
              height: 100.h, width: 100.w),
        ],
      );
    } else if (finishTestEntity!.score! > 82 &&
        finishTestEntity!.score! < 101) {
      return Column(
        children: [
          Image.asset('assets/icon/certificatePlatinum.png',
              height: 100.h, width: 100.w),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  buttonNext(BuildContext context, String testTypeTemp) {
    if (finishTestEntity!.score! < 57) {
      return Column(
        children: [
          InkWell(
            child:
                buttonWithIcon('Получить консультацию', 'message-search.png'),
            onTap: () {
              PaymentInfoEntity paymentInfo = PaymentInfoEntity(
                  testId: testId!,
                  paymentType: '2',
                  sum: sumConsult(categoryId.toString(), companyArea!),
                  categoryId: categoryId!,
                  companyName: UserData.companyName!,
                  companyDirector: UserData.name!,
                  region: UserData.region!,
                  phone: UserData.phone!,
                  area: companyArea!);
              BlocProvider.of<GetDataFromGetConsultationBloc>(context).add(
                  LoadGetDataFromGetConsultation(
                      paymentInfoEntity: paymentInfo));
              AutoRouter.of(context).replace(PaymentGetConsultationRoute());
              // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ConsultationScreen(testId: testId!,sum: sumConsult(categoryId!,companyArea!))));
            },
          ),
          SizedBox(height: 32.h),
          InkWell(
            child: button(text: 'Пройти тест повторно'),
            onTap: () {
              AutoRouter.of(context).pop();
            },
          )
        ],
      );
    } else {
      return Column(
        children: [
          InkWell(
            child: button(
                text: testTypeTemp == 'auditTest'
                    ? 'Вернуться'
                    : 'Пройти сертификацию'),
            onTap: () {
              testTypeTemp == 'auditTest'
                  ? AutoRouter.of(context).pop()
                  : BlocProvider.of<GetDataFromGetCertificateBloc>(context).add(
                      LoadGetDataFromGetCertificate(
                          paymentInfoEntity: PaymentInfoEntity(
                          testId: testId!,
                          paymentType: '1',
                          sum: sumCertificate(categoryId.toString(), companyArea!),
                          categoryId: categoryId!,
                          companyName: UserData.companyName!,
                          companyDirector: UserData.name!,
                          region: UserData.region!,
                          phone: UserData.phone!,
                          area: companyArea!)));
              AutoRouter.of(context).replace(PaymentGetCertificateRoute());
              // Navigator.of(context).push(MaterialPageRoute(builder:(context)=> GetCertificatScreen(testId: testId!,sum: sumCertificate(categoryId!,companyArea!))));
            },
          )
        ],
      );
    }
  }
}
