import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/repository.dart';

@injectable
class ReadAuthKey implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;
  ReadAuthKey({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    return await authRepository.readAuthKey();
  }
}
