import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/audit_test_list_entity.dart';
import '../repository/repository.dart';

@injectable
class AcceptAuditTestUseCase extends UseCase<bool,String>{
  final AuditRepository auditTestListRepository;
  AcceptAuditTestUseCase({required this.auditTestListRepository});

  @override
  Future<Either<Failure, bool>> call(String testId) async{
    return await auditTestListRepository.acceptAuditTestList(testId);
  }
}