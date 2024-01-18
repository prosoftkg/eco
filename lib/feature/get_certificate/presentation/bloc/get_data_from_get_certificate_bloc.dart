import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/paymentInfoEntity.dart';
import 'package:equatable/equatable.dart';

part 'get_data_from_get_certificate_event.dart';
part 'get_data_from_get_certificate_state.dart';

class GetDataFromGetCertificateBloc extends Bloc<GetDataFromGetCertificateEvent, GetDataFromGetCertificateState> {
  GetDataFromGetCertificateBloc() : super(GetDataFromGetCertificateInitial()) {
    on<LoadGetDataFromGetCertificate>((event, emit) {
      emit(LoadedGetDataFromGetCertificateState(paymentInfoEntity: event.paymentInfoEntity));
    });
  }
}
