import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/repository.dart';

@injectable
class SignIn implements UseCase<bool, String> {
  final AuthRepository authRepository;
  SignIn({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call(String email) async {
    return await authRepository.signIn(email);
  }
}
