import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  PaymentEntity({
    required this.paymentUrl,
  });

  final String? paymentUrl;

  factory PaymentEntity.fromJson(String json){
    return PaymentEntity(
      paymentUrl: json
    );
  }

  @override
  List<Object?> get props => [
    paymentUrl, ];
}
