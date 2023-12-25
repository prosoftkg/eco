import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:eco_kg/feature/test_feature/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';

@injectable
class BeginAuditTestUseCase extends UseCase<BeginTestEntity,String>{
  final TestRepository beginAuditTestRepository;
  BeginAuditTestUseCase({required this.beginAuditTestRepository});

  @override
  Future<Either<Failure, BeginTestEntity>> call(String testId) async{
    return await beginAuditTestRepository.beginAuditTest(testId);
  }
}