import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/getCertificateInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/domain/use_case/get_certificate_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/use_case/use_case.dart';

part 'get_certificate_event.dart';
part 'get_certificate_state.dart';

class GetCertificateBloc extends Bloc<GetCertificateEvent, GetCertificateState> {
  final GetCertificateUseCase getCertificateUseCase;
  GetCertificateBloc({required this.getCertificateUseCase}) : super(GetCertificateInitial()) {
    on<LoadGetCertificateEvent>(_getCertificate);
    on<LoadNextGetCertificateEvent>(_getNextCertificate);
  }
  _getCertificate(LoadGetCertificateEvent event,Emitter emit)async{
    emit(LoadingGetCertificateState());
    final either=await getCertificateUseCase.call(event.getCertificateInfoEntity);
    either.fold((error) => emit(ErrorGetCertificateState(error: error)), (getCertificate){
      emit(const LoadedGetCertificateState());
    });
  }

  _getNextCertificate(LoadNextGetCertificateEvent event,Emitter emit){
    emit(const LoadNextGetCertificateState());
  }
}
