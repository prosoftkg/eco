import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userData.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_journal/error_journal.dart';
import '../../domain/repository/repository.dart';
import '../data_source/user_cabinet_server.dart';

@Injectable(as: UserCabinetRepository)

class UserCabinetRepositoryImpl implements UserCabinetRepository{
  final UserCabinetDataSource userCabinetDataSource;
  UserCabinetRepositoryImpl({required this.userCabinetDataSource});

  @override
  Future<Either<Failure, bool>> editUserData(UserDataForEdit userDataForEdit) {
    return _editUserData(userDataForEdit);
  }

  Future<Either<Failure,bool>> _editUserData(UserDataForEdit userDataForEdit) async{
    try{
      final editUser=await userCabinetDataSource.editUserData(userDataForEdit);
      return Right(editUser);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProfile() {
    return _deleteProfile();
  }

  Future<Either<Failure,bool>> _deleteProfile() async{
    try{
      final deleteProfile=await userCabinetDataSource.deleteProfile();
      return Right(deleteProfile);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

}