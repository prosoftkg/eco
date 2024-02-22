import 'package:eco_kg/feature/audit_test_consult_feature/domain/entities/audit_consult_list_entity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/nextQuestionEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../domain/entities/audit_test_list_entity.dart';
import '../../domain/repository/repository.dart';
import '../data_source/audit_server.dart';

@Injectable(as: AuditRepository)

class AuditRepositoryImpl implements AuditRepository{
  final AuditDataSource auditDataSource;
  AuditRepositoryImpl({required this.auditDataSource});

  @override
  Future<Either<Failure, List<AuditTest>>> auditTestList() {
    return _auditTestList();
  }

  Future<Either<Failure,List<AuditTest>>> _auditTestList() async{
    try{
      final auditTestList=await auditDataSource.auditTestList();
      return Right(auditTestList);
    }on Failure catch(e){
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, List<AuditConsult>>> auditConsultList() {
    return _auditConsultList();
  }

  Future<Either<Failure,List<AuditConsult>>> _auditConsultList() async{
    try{
      final auditConsultList=await auditDataSource.auditConsultList();
      return Right(auditConsultList);
    }on Failure catch(e){
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure,bool>> denyAuditTestList(String testId){
    return _denyAuditTestList(testId);
  }

  Future<Either<Failure,bool>> _denyAuditTestList(String testId)async{
    try{
      final denyAuditTest=await auditDataSource.denyAuditTestList(testId);
      return Right(denyAuditTest);
    }on Failure catch(e){
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure,bool>> acceptAuditTestList(String testId){
    return _acceptAuditTestList(testId);
  }

  Future<Either<Failure,bool>> _acceptAuditTestList(String testId)async{
    try{
      final acceptAuditTest=await auditDataSource.acceptAuditTestList(testId);
      return Right(acceptAuditTest);
    }on Failure catch(e){
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure,bool>> denyAuditConsultList(String consultId){
    return _denyAuditConsultList(consultId);
  }

  Future<Either<Failure,bool>> _denyAuditConsultList(String consultId)async{
    try{
      final denyAuditConsult=await auditDataSource.denyAuditConsultList(consultId);
      return Right(denyAuditConsult);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure,bool>> confirmAuditConsultList(String testId){
    return _confirmAuditConsultList(testId);
  }

  Future<Either<Failure,bool>> _confirmAuditConsultList(String testId)async{
    try{
      final confirmAuditConsult=await auditDataSource.confirmAuditConsultList(testId);
      return Right(confirmAuditConsult);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

}