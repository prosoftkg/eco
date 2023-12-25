part of 'accept_audit_test_bloc.dart';

abstract class AcceptAuditTestEvent extends Equatable {
  const AcceptAuditTestEvent();
}

class OnTapAcceptEvent extends AcceptAuditTestEvent{
  final String auditTestId;
  const OnTapAcceptEvent({required this.auditTestId});
  @override
  List<Object> get props=>[auditTestId];
}

class OnTapDenyEvent extends AcceptAuditTestEvent{
  final String auditTestId;
  const OnTapDenyEvent({required this.auditTestId});
  @override
  List<Object> get props=>[auditTestId];
}


class CheckAcceptEvent extends AcceptAuditTestEvent{
  final String auditTestId;
  const CheckAcceptEvent({required this.auditTestId});
  @override
  List<Object> get props=>[auditTestId];
}