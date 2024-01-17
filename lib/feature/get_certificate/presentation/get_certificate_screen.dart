import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/get_certificate/presentation/bloc/get_data_from_get_certificate_bloc.dart';
import 'package:eco_kg/feature/get_certificate/presentation/bloc/get_data_from_get_certificate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/auto_route/auto_route.dart';
import '../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../payment_feature/domain/entities/paymentInfoEntity.dart';
import '../../payment_feature/presentation/bloc/payment_bloc.dart';
import '../../widgets/progressWidget.dart';
import 'package:auto_route/auto_route.dart';

class GetCertificatScreen extends StatelessWidget {

  const GetCertificatScreen(
      {super.key});

  @override
  Widget build(BuildContext context) {
    var sum;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.get_certificate),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100,
      ),
      body: BlocBuilder<GetDataFromGetCertificateBloc, GetDataFromGetCertificateState>(
        builder: (context, state) {
          if(state is LoadedGetDataFromGetCertificateState){
            sum=state.sum;
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 62.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.text.pay_certificate,
                        style: AppTextStyles.clearSansMediumS22W500CBlack),
                    SizedBox(height: 22.h),
                    Text(context.text.pay_certificate_text,
                        style: AppTextStyles.hintStyle),
                  ],
                ),
                BlocBuilder<PaymentBloc, PaymentState>(
                  builder: (context, state) {
                    if (state is LoadingPaymentState) {
                      return Center(child: progressWidget());
                    }
                    if (state is LoadedPaymentState) {
                      print('tap');
                      AutoRouter.of(context).replace(const PaymentRoute());
                    }
                    return InkWell(onTap: () {
                      BlocProvider.of<PaymentBloc>(context)
                          .add(LoadPaymentEvent(
                          paymentInfoEntity: PaymentInfoEntity(
                              testId: '0', paymentType: '1', sum: sum)));
                    }, child: button(text: context.text.pay));
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
