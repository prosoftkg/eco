import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../domain/repository/repository.dart';
import '../data_source/auth_server.dart';


@Injectable(as: AuthRepository)

class AuthRepositoryImpl implements AuthRepository{
  final AuthSourse authSourse;
  AuthRepositoryImpl({required this.authSourse});

  @override
  Future<Either<Failure, bool>> signIn(String email) async {
    return await _signIn(email);
  }

  Future<Either<Failure, bool>> _signIn(String email) async {
    try {
      final truth = await authSourse.signIn(email);
      return Right(truth);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, bool>> readAuthKey() async {
    return await _readAuthKey();
  }

  Future<Either<Failure, bool>> _readAuthKey() async {
    try {
      final pwModel = await authSourse.readAuthKey();
      return Right(pwModel);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, bool>> checkConfirmationCode(String code) async {
    return await _checkConfirmationCode(code);
  }

  Future<Either<Failure, bool>> _checkConfirmationCode(String code) async {
    try {
      final truth = await authSourse.checkConfirmationCode(code);
      return Right(truth);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }
}