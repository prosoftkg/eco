part of 'audit_bloc.dart';

abstract class AuditState extends Equatable {
  const AuditState();
}

class AuditInitial extends AuditState {
  @override
  List<Object> get props => [];
}

class LoadingAuditState extends AuditState{
  @override
  List<Object> get props=>[];
}

class LoadedAuditTestListState extends AuditState{
  final List<AuditTest> auditTestList;
  const LoadedAuditTestListState({required this.auditTestList});
  @override
  List<Object> get props=>[auditTestList];
}

class LoadedAuditConsultListState extends AuditState{
  final List<AuditTest> auditConsultList;
  const LoadedAuditConsultListState({required this.auditConsultList});
  @override
  List<Object> get props=>[auditConsultList];
}

class ErrorAuditState extends AuditState{
  final Object error;
  const ErrorAuditState({required this.error});
  @override
  List<Object> get props=>[error];
}
