part of 'get_certificate_bloc.dart';

abstract class GetCertificateEvent extends Equatable {
  const GetCertificateEvent();
}

class LoadGetCertificateEvent extends GetCertificateEvent{
  final GetCertificateInfoEntity getCertificateInfoEntity;
  const LoadGetCertificateEvent({required this.getCertificateInfoEntity});
  @override
  List<Object> get props=>[getCertificateInfoEntity];
}

