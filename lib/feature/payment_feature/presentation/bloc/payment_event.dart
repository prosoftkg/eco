part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class LoadPaymentEvent extends PaymentEvent{
  final PaymentInfoEntity paymentInfoEntity;
  const LoadPaymentEvent({required this.paymentInfoEntity});
  @override
  List<Object> get props=>[paymentInfoEntity];
}

class StartPageEvent extends PaymentEvent{
  const StartPageEvent();
  @override
  List<Object> get props=>[];
}

class FinishPageEvent extends PaymentEvent{
  const FinishPageEvent();
  @override
  List<Object> get props=>[];
}
