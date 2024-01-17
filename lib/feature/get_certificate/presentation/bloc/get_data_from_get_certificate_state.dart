part of 'get_data_from_get_certificate_bloc.dart';

abstract class GetDataFromGetCertificateState extends Equatable {
  const GetDataFromGetCertificateState();
}

class GetDataFromGetCertificateInitial extends GetDataFromGetCertificateState {
  @override
  List<Object> get props => [];
}

class LoadedGetDataFromGetCertificateState extends GetDataFromGetCertificateState{
  final String sum;
  final String testId;
  const LoadedGetDataFromGetCertificateState({required this.sum,required this.testId});
  @override
  List<Object> get props=>[sum];
}

