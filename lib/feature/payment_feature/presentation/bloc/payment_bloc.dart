import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/payment_entity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/paymentInfoEntity.dart';
import '../../domain/use_case/payment_use_case.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentUseCase paymentUseCase;
  PaymentBloc({required this.paymentUseCase}) : super(PaymentInitial()) {
    on<LoadPaymentEvent>(_payment);
    on<StartPageEvent>(_startPage);
    on<FinishPageEvent>(_finishPage);
  }
  _payment(LoadPaymentEvent event,Emitter emit)async{
    emit(LoadingPaymentState());
    final either=await paymentUseCase.call(event.paymentInfoEntity);
    either.fold((error) => emit(ErrorPaymentState(error: error)), (payment){
      emit(LoadedPaymentState(paymentEntity: payment));
    });
  }
  _startPage(StartPageEvent event,Emitter emit)async{
    emit(LoadingPaymentState());
  }
  _finishPage(FinishPageEvent event,Emitter emit)async{
    emit(const FinishPageState());
  }
}
