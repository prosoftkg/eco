import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/nextQuestionEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../domain/entities/finishTestEntity.dart';
import '../../domain/entities/testIngoForNext.dart';
import '../../domain/repository/repository.dart';
import '../data_source/test_server.dart';

@Injectable(as: TestRepository)

class TestRepositoryImpl implements TestRepository{
  final TestDataSource testDataSource;
  TestRepositoryImpl({required this.testDataSource});

  @override
  Future<Either<Failure, BeginTestEntity>> beginTest(TestInfoForBegin testInfoForBegin) {
    return _beginTest(testInfoForBegin);
  }

  Future<Either<Failure,BeginTestEntity>> _beginTest(TestInfoForBegin testInfoForBegin) async{
    try{
      final library=await testDataSource.postBeginTest(testInfoForBegin);
      return Right(library);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, BeginTestEntity>> beginAuditTest(String testId) {
    return _beginAuditTest(testId);
  }

  Future<Either<Failure,BeginTestEntity>> _beginAuditTest(String testId) async{
    try{
      final library=await testDataSource.postBeginAuditTest(testId);
      return Right(library);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, NextQuestionEntity>> nextTest(TestInfoForNext testInfoForNext) {
    return _nextTest(testInfoForNext);
  }

  Future<Either<Failure,NextQuestionEntity>> _nextTest(TestInfoForNext testInfoForNext) async{
    try{
      final library=await testDataSource.postNextTest(testInfoForNext);
      return Right(library);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, NextQuestionEntity>> nextAuditTest(TestInfoForNext testInfoForNext) {
    return _nextAuditTest(testInfoForNext);
  }

  Future<Either<Failure,NextQuestionEntity>> _nextAuditTest(TestInfoForNext testInfoForNext) async{
    try{
      final library=await testDataSource.postNextTest(testInfoForNext);
      return Right(library);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, FinishTestEntity>> finishTest(TestInfoForNext testInfoForNext) {
    return _finishTest(testInfoForNext);
  }

  Future<Either<Failure,FinishTestEntity>> _finishTest(TestInfoForNext testInfoForNext) async{
    try{
      final finishTest=await testDataSource.finishTest(testInfoForNext);
      return Right(finishTest);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

}