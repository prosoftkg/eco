import 'package:eco_kg/feature/audit_test_consult_feature/domain/entities/audit_consult_list_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/audit_test_list_entity.dart';
import '../repository/repository.dart';

@injectable
class AuditConsultListUseCase extends UseCase<List<AuditConsult>,NoParams>{
  final AuditRepository auditTestListRepository;
  AuditConsultListUseCase({required this.auditTestListRepository});

  @override
  Future<Either<Failure, List<AuditConsult>>> call(NoParams params) async{
    return await auditTestListRepository.auditConsultList();
  }
}