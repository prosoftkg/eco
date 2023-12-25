import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/paymentInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/payment_entity.dart';
import '../../../../core/error_journal/error_journal.dart';

abstract interface class PaymentRepository{
  Future<Either<Failure,PaymentEntity>> payment(PaymentInfoEntity paymentInfoEntity);
}