import 'package:dartz/dartz.dart';
import '../../../../core/error_journal/error_journal.dart';
import '../entities/audit_test_list_entity.dart';

abstract interface class AuditRepository{
  Future<Either<Failure,List<AuditTest>>> auditTestList();
  Future<Either<Failure,List<AuditTest>>> auditConsultList();
  Future<Either<Failure,bool>> denyAuditTestList(String testId);
  Future<Either<Failure,bool>> denyAuditConsultList(String consultId);
  Future<Either<Failure,bool>> confirmAuditConsultList(String testId);
}