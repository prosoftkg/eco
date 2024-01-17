part of 'accept_audit_test_bloc.dart';

abstract class AcceptAuditTestState extends Equatable {
  const AcceptAuditTestState();
}

class AcceptAuditTestInitial extends AcceptAuditTestState {
  @override
  List<Object> get props => [];
}

class LoadingAcceptAuditTestState extends AcceptAuditTestState{
  @override
  List<Object> get props=>[];
}

class AcceptedAuditTestState extends AcceptAuditTestState{
  const AcceptedAuditTestState();
  @override
  List<Object> get props=>[];
}

class LoadedDenyAuditTestState extends AcceptAuditTestState{
  const LoadedDenyAuditTestState();
  @override
  List<Object> get props=>[];
}


class NewAuditTestState extends AcceptAuditTestState{
  const NewAuditTestState();
  @override
  List<Object> get props=>[];
}

class ErrorAcceptAuditTestState extends AcceptAuditTestState{
  final Object error;
  const ErrorAcceptAuditTestState({required this.error});
  @override
  List<Object> get props=>[error];
}