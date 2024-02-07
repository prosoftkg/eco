import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/getCertificateInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/domain/use_case/get_certificate_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../domain/use_case/get_consultation_use_case.dart';

part 'get_certificate_event.dart';
part 'get_certificate_state.dart';

class GetConsultationBloc extends Bloc<GetConsultationEvent, GetConsultationState> {
  final GetConsultationUseCase getConsultationUseCase;
  GetConsultationBloc({required this.getConsultationUseCase}) : super(GetConsultationInitial()) {
    on<LoadGetConsultationEvent>(_getConsultation);
    on<LoadNextGetConsultationEvent>(_getNextConsultation);
  }

  _getConsultation(LoadGetConsultationEvent event,Emitter emit)async{
    emit(LoadingGetConsultationState());
    final either=await getConsultationUseCase.call(event.getCertificateInfoEntity);
    either.fold((error) => emit(ErrorGetConsultationState(error: error)), (getConsultation){
      emit(LoadedGetConsultationState());
    });
  }
  _getNextConsultation(LoadNextGetConsultationEvent event,Emitter emit){
      emit(LoadNextGetConsultationState());
  }
}
