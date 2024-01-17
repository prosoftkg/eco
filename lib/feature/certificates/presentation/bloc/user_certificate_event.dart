part of 'user_certificate_bloc.dart';

abstract class UserCertificateEvent extends Equatable {
  const UserCertificateEvent();
}

class LoadUserCertificateEvent extends UserCertificateEvent{
  const LoadUserCertificateEvent();
  @override
  List<Object> get props=>[];
}
