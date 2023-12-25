import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/paymentInfoEntity.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/auto_route/auto_route.dart';
import '../../payment_feature/presentation/bloc/payment_bloc.dart';
import 'package:auto_route/auto_route.dart';

class ConsultationScreen extends StatelessWidget {
  final String testId;

  const ConsultationScreen({super.key, required this.testId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.get_consultation),
      ),
      body: Padding(
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
              builder: (context, state) {
                if(state is LoadingPaymentState){
                  return Center(child: progressWidget());
                }
                if(state is LoadedPaymentState){
                  print('tap');
                  AutoRouter.of(context).replace(const PaymentRoute());
                }
                return InkWell(onTap: () {
                  BlocProvider.of<PaymentBloc>(context)
                    .add(LoadPaymentEvent(paymentInfoEntity: PaymentInfoEntity(
                        testId: testId, paymentType: '1')));
                }, child: button(text: context.text.pay));
              },
            )
          ],
        ),
      ),
    );
  }
}
