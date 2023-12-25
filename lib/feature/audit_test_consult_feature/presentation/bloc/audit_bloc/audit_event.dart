part of 'audit_bloc.dart';

abstract class AuditEvent extends Equatable {
  const AuditEvent();
}

class AuditTestListEvent extends AuditEvent{
  const AuditTestListEvent();
  @override
  List<Object> get props=>[];
}

class AuditConsultListEvent extends AuditEvent{
  const AuditConsultListEvent();
  @override
  List<Object> get props=>[];
}

