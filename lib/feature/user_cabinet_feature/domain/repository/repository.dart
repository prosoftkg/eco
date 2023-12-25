import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userData.dart';
import '../../../../core/error_journal/error_journal.dart';

abstract interface class UserCabinetRepository{
  Future<Either<Failure,bool>> editUserData(UserDataForEdit userDataForEdit);
}