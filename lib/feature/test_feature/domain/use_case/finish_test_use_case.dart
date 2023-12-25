import 'package:eco_kg/feature/test_feature/domain/entities/finishTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/nextQuestionEntity.dart';

import 'package:eco_kg/feature/test_feature/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/testIngoForNext.dart';

@injectable
class FinishTestUseCase extends UseCase<FinishTestEntity,TestInfoForNext>{
  final TestRepository beginTestRepository;
  FinishTestUseCase({required this.beginTestRepository});

  @override
  Future<Either<Failure, FinishTestEntity>> call(TestInfoForNext testInfoForNext) async{
    return await beginTestRepository.finishTest(testInfoForNext);
  }
}
