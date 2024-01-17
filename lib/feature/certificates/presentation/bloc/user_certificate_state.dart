part of 'user_certificate_bloc.dart';

abstract class UserCertificateState extends Equatable {
  const UserCertificateState();
}

class UserCertificateInitial extends UserCertificateState {
  @override
  List<Object> get props => [];
}

class LoadingUserCertificateState extends UserCertificateState{
  @override
  List<Object> get props=>[];
}

class LoadedUserCertificateState extends UserCertificateState{
  final List<UserCertificate> userCertificate;
  const LoadedUserCertificateState({required this.userCertificate});
  @override
  List<Object> get props=>[userCertificate];
}

class ErrorUserCertificateState extends UserCertificateState{
  final Object error;
  const ErrorUserCertificateState({required this.error});
  @override
  List<Object> get props=>[error];
}


