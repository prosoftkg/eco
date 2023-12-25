import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, bool>> signIn(String email);
  Future<Either<Failure, bool>> readAuthKey();
  Future<Either<Failure, bool>> checkConfirmationCode(String code);
}
