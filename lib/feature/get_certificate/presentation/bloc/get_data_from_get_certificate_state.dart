part of 'get_data_from_get_certificate_bloc.dart';

abstract class GetDataFromGetCertificateState extends Equatable {
  const GetDataFromGetCertificateState();
}

class GetDataFromGetCertificateInitial extends GetDataFromGetCertificateState {
  @override
  List<Object> get props => [];
}

class LoadedGetDataFromGetCertificateState extends GetDataFromGetCertificateState{
  final PaymentInfoEntity paymentInfoEntity;
  const LoadedGetDataFromGetCertificateState({required this.paymentInfoEntity});
  @override
  List<Object> get props=>[paymentInfoEntity];
}

