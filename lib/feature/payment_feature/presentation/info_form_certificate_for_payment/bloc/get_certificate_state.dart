part of 'get_certificate_bloc.dart';

abstract class GetCertificateState extends Equatable {
  const GetCertificateState();
}

class GetCertificateInitial extends GetCertificateState {
  @override
  List<Object> get props => [];
}


class LoadingGetCertificateState extends GetCertificateState{
  @override
  List<Object> get props=>[];
}

class LoadedGetCertificateState extends GetCertificateState{
  const LoadedGetCertificateState();
  @override
  List<Object> get props=>[];
}

class ErrorGetCertificateState extends GetCertificateState{
  final Object error;
  const ErrorGetCertificateState({required this.error});
  @override
  List<Object> get props=>[error];
}