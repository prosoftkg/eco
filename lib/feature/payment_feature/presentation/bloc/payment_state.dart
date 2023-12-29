part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
}

class PaymentInitial extends PaymentState {
  @override
  List<Object> get props => [];
}

class LoadingPaymentState extends PaymentState{
  @override
  List<Object> get props=>[];
}

class LoadedPaymentState extends PaymentState{
  final PaymentEntity paymentEntity;
  const LoadedPaymentState({required this.paymentEntity});
  @override
  List<Object> get props=>[paymentEntity];
}

class LoadedUrlPaymentState extends PaymentState{
  final PaymentEntity paymentEntity;
  const LoadedUrlPaymentState({required this.paymentEntity});
  @override
  List<Object> get props=>[paymentEntity];
}

class FinishPageState extends PaymentState{
  const FinishPageState();
  @override
  List<Object> get props=>[];
}

class ErrorPaymentState extends PaymentState{
  final Object error;
  const ErrorPaymentState({required this.error});
  @override
  List<Object> get props=>[error];
}
