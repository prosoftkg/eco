import 'package:eco_kg/feature/payment_feature/domain/entities/paymentInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/payment_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../domain/repository/repository.dart';
import '../data_source/payment_server.dart';

@Injectable(as: PaymentRepository)

class PaymentRepositoryImpl implements PaymentRepository{
  final PaymentDataSource paymentDataSource;
  PaymentRepositoryImpl({required this.paymentDataSource});

  @override
  Future<Either<Failure, PaymentEntity>> payment(PaymentInfoEntity paymentInfoEntity) {
    return _payment(paymentInfoEntity);
  }

  Future<Either<Failure,PaymentEntity>> _payment(PaymentInfoEntity paymentInfoEntity) async{
    try{
      final library=await paymentDataSource.payment(paymentInfoEntity);
      return Right(library);
    }on Failure catch(e){
      print('error exeption');
      return Left(ServerError(error: e));
    }
  }

}