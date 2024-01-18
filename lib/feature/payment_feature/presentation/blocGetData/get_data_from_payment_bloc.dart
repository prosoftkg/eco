import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_data_from_payment_event.dart';
part 'get_data_from_payment_state.dart';

class GetDataFromPaymentBloc extends Bloc<GetDataFromPaymentEvent, GetDataFromPaymentState> {
  GetDataFromPaymentBloc() : super(GetDataFromPaymentInitial()) {
    on<LoadGetData>((event, emit) {
      emit(LoadedGetData(url: event.url));
    });
  }
}
