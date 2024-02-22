part of 'get_data_from_get_consultation_bloc.dart';

abstract class GetDataFromGetConsultationState extends Equatable {
  const GetDataFromGetConsultationState();
}

class GetDataFromGetConsultationInitial extends GetDataFromGetConsultationState {
  @override
  List<Object> get props => [];
}

class LoadedGetDataFromGetConsultationState extends GetDataFromGetConsultationState{
  final PaymentInfoEntity paymentInfoEntity;
  const LoadedGetDataFromGetConsultationState({required this.paymentInfoEntity});
  @override
  List<Object> get props=>[paymentInfoEntity];
}