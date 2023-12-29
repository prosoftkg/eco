part of 'accept_audit_consult_bloc.dart';

abstract class AcceptAuditConsultState extends Equatable {
  const AcceptAuditConsultState();
}

class AcceptAuditConsultInitial extends AcceptAuditConsultState {
  @override
  List<Object> get props => [];
}

class LoadingAcceptAuditConsultState extends AcceptAuditConsultState{
  @override
  List<Object> get props=>[];
}

class AcceptedAuditConsultState extends AcceptAuditConsultState{
  const AcceptedAuditConsultState();
  @override
  List<Object> get props=>[];
}

class LoadedConfirmAuditConsultState extends AcceptAuditConsultState{
  const LoadedConfirmAuditConsultState();
  @override
  List<Object> get props=>[];
}

class LoadedDenyAuditConsultState extends AcceptAuditConsultState{
  const LoadedDenyAuditConsultState();
  @override
  List<Object> get props=>[];
}

class NewAuditConsultState extends AcceptAuditConsultState{
  const NewAuditConsultState();
  @override
  List<Object> get props=>[];
}

class ErrorAcceptAuditConsultState extends AcceptAuditConsultState{
  final Object error;
  const ErrorAcceptAuditConsultState({required this.error});
  @override
  List<Object> get props=>[error];
}