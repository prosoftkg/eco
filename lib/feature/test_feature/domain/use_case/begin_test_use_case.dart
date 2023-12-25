import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:eco_kg/feature/test_feature/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';

@injectable
class BeginTestUseCase extends UseCase<BeginTestEntity,TestInfoForBegin>{
  final TestRepository beginTestRepository;
  BeginTestUseCase({required this.beginTestRepository});

  @override
  Future<Either<Failure, BeginTestEntity>> call(TestInfoForBegin testInfoForBegin) async{
    return await beginTestRepository.beginTest(testInfoForBegin);
  }
}