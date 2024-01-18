import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/paymentInfoEntity.dart';
import 'package:equatable/equatable.dart';

part 'get_data_from_get_consultation_event.dart';
part 'get_data_from_get_consultation_state.dart';

class GetDataFromGetConsultationBloc extends Bloc<GetDataFromGetConsultationEvent, GetDataFromGetConsultationState> {
  GetDataFromGetConsultationBloc() : super(GetDataFromGetConsultationInitial()) {
    on<LoadGetDataFromGetConsultation>((event, emit) {
      emit(LoadedGetDataFromGetConsultationState(paymentInfoEntity: event.paymentInfoEntity));
    });
  }
}
