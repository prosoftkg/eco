part of 'get_data_from_get_certificate_bloc.dart';

abstract class GetDataFromGetCertificateEvent extends Equatable {
  const GetDataFromGetCertificateEvent();
}

class LoadGetDataFromGetCertificate extends GetDataFromGetCertificateEvent{
  final PaymentInfoEntity paymentInfoEntity;
  const LoadGetDataFromGetCertificate({required this.paymentInfoEntity});
  @override
  List<Object> get props=>[paymentInfoEntity];
}
