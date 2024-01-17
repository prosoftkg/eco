part of 'get_data_from_get_certificate_bloc.dart';

abstract class GetDataFromGetCertificateEvent extends Equatable {
  const GetDataFromGetCertificateEvent();
}

class LoadGetDataFromGetCertificate extends GetDataFromGetCertificateEvent{
  final String sum;
  final String testId;
  const LoadGetDataFromGetCertificate({required this.sum,required this.testId});
  @override
  List<Object> get props=>[sum];
}
