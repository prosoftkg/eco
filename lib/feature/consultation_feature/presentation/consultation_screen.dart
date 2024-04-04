import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/paymentInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/presentation/blocGetData/get_data_from_payment_bloc.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/auto_route/auto_route.dart';
import '../../../core/servise_locator/servise_locator.dart';
import '../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../payment_feature/presentation/bloc/payment_bloc.dart';
import 'package:auto_route/auto_route.dart';

import 'bloc/get_data_from_get_consultation_bloc.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentInfoEntity;
    var myBloc = getIt<PaymentBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.get_consultation),
        leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: UserData.sizeScreen ? 100.w : 100,
      ),
      body: BlocBuilder<GetDataFromGetConsultationBloc,
          GetDataFromGetConsultationState>(
        builder: (context, state) {
          if (state is LoadedGetDataFromGetConsultationState) {
            paymentInfoEntity = state.paymentInfoEntity;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 62),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.text.paid_consultation,
                        style: AppTextStyles.clearSansMediumS22W500CBlack),
                    SizedBox(height: 22.h),
                    Text(context.text.paid_consultation_text,
                        style: AppTextStyles.hintStyle),
                  ],
                ),
                BlocBuilder<PaymentBloc, PaymentState>(
                  bloc: myBloc,
                  builder: (context, state) {
                    if (state is LoadingPaymentState) {
                      return Center(child: progressWidget());
                    }
                    if (state is LoadedPaymentState) {
                      print('tap');
                      BlocProvider.of<GetDataFromPaymentBloc>(context).add(
                          LoadGetData(url: state.paymentEntity.paymentUrl!));
                      AutoRouter.of(context).replace(const PaymentRoute());
                    }
                    return InkWell(
                        onTap: () {
                          myBloc.add(LoadPaymentEvent(
                              paymentInfoEntity:
                                  paymentInfoEntity /*PaymentInfoEntity(
                              testId: testId, paymentType: '2', sum: sum)*/
                              ));
                        },
                        child: button(text: context.text.pay));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
