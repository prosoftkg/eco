import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/audit_test_list_entity.dart';
import '../repository/repository.dart';

@injectable
class AuditTestListUseCase extends UseCase<List<AuditTest>,NoParams>{
  final AuditRepository auditTestListRepository;
  AuditTestListUseCase({required this.auditTestListRepository});

  @override
  Future<Either<Failure, List<AuditTest>>> call(NoParams params) async{
    return await auditTestListRepository.auditTestList();
  }
}