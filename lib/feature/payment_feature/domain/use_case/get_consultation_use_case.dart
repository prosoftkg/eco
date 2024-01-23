import 'package:eco_kg/feature/payment_feature/domain/entities/getCertificateInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/paymentInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/payment_entity.dart';
import 'package:eco_kg/feature/payment_feature/domain/repository/repository.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:eco_kg/feature/test_feature/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';

@injectable
class GetConsultationUseCase extends UseCase<bool,GetCertificateInfoEntity>{
  final PaymentRepository paymentRepository;
  GetConsultationUseCase({required this.paymentRepository});

  @override
  Future<Either<Failure, bool>> call(GetCertificateInfoEntity getConsultationInfoEntity) async{
    return await paymentRepository.getConsultation(getConsultationInfoEntity);
  }
}