import 'package:eco_kg/feature/test_feature/domain/entities/nextQuestionEntity.dart';

import 'package:eco_kg/feature/test_feature/domain/repository/repository.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userData.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/repository.dart';

@injectable
class EditUserDataUseCase extends UseCase<bool,UserDataForEdit>{
  final UserCabinetRepository userCabinetRepository;
  EditUserDataUseCase({required this.userCabinetRepository});

  @override
  Future<Either<Failure, bool>> call(UserDataForEdit userDataForEdit) async{
    return await userCabinetRepository.editUserData(userDataForEdit);
  }
}