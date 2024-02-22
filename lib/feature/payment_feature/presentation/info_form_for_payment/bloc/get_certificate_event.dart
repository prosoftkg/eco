part of 'get_certificate_bloc.dart';

abstract class GetConsultationEvent extends Equatable {
  const GetConsultationEvent();
}

class LoadGetConsultationEvent extends GetConsultationEvent{
  final GetCertificateInfoEntity getCertificateInfoEntity;
  const LoadGetConsultationEvent({required this.getCertificateInfoEntity});
  @override
  List<Object> get props=>[getCertificateInfoEntity];
}

