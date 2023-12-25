import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@injectable
class CheckConfirmationCode implements UseCase<bool, String> {
  final AuthRepository authRepository;
  CheckConfirmationCode({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call(String code) async {
    return await authRepository.checkConfirmationCode(code);
  }
}