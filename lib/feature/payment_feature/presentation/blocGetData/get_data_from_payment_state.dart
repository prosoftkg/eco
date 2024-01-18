part of 'get_data_from_payment_bloc.dart';

abstract class GetDataFromPaymentState extends Equatable {
  const GetDataFromPaymentState();
}

class GetDataFromPaymentInitial extends GetDataFromPaymentState {
  @override
  List<Object> get props => [];
}


class LoadedGetData extends GetDataFromPaymentState{
  final String url;
  const LoadedGetData({required this.url});
  @override
  List<Object> get props=>[url];
}