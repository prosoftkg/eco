part of 'accept_audit_consult_bloc.dart';

abstract class AcceptAuditConsultEvent extends Equatable {
  const AcceptAuditConsultEvent();
}

class OnTapConsultAcceptEvent extends AcceptAuditConsultEvent{
  final String auditTestId;
  const OnTapConsultAcceptEvent({required this.auditTestId});
  @override
  List<Object> get props=>[auditTestId];
}

class OnTapConfirmEvent extends AcceptAuditConsultEvent{
  final String auditTestId;
  const OnTapConfirmEvent({required this.auditTestId});
  @override
  List<Object> get props=>[auditTestId];
}


class CheckConsultAcceptEvent extends AcceptAuditConsultEvent{
  final String auditTestId;
  const CheckConsultAcceptEvent({required this.auditTestId});
  @override
  List<Object> get props=>[auditTestId];
}