part of 'get_data_from_get_consultation_bloc.dart';

abstract class GetDataFromGetConsultationEvent extends Equatable {
  const GetDataFromGetConsultationEvent();
}

class LoadGetDataFromGetConsultation extends GetDataFromGetConsultationEvent{
  final PaymentInfoEntity paymentInfoEntity;
  const LoadGetDataFromGetConsultation({required this.paymentInfoEntity});
  @override
  List<Object> get props=>[paymentInfoEntity];
}