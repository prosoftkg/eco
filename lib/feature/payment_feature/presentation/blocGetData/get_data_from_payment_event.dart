part of 'get_data_from_payment_bloc.dart';

abstract class GetDataFromPaymentEvent extends Equatable {
  const GetDataFromPaymentEvent();
}


class LoadGetData extends GetDataFromPaymentEvent{
  final String url;
  const LoadGetData({required this.url});
  @override
  List<Object> get props=>[url];
}
