part of 'get_certificate_bloc.dart';

abstract class GetConsultationState extends Equatable {
  const GetConsultationState();
}

class GetConsultationInitial extends GetConsultationState {
  @override
  List<Object> get props => [];
}


class LoadingGetConsultationState extends GetConsultationState{
  @override
  List<Object> get props=>[];
}

class LoadedGetConsultationState extends GetConsultationState{
  const LoadedGetConsultationState();
  @override
  List<Object> get props=>[];
}

class ErrorGetConsultationState extends GetConsultationState{
  final Object error;
  const ErrorGetConsultationState({required this.error});
  @override
  List<Object> get props=>[error];
}