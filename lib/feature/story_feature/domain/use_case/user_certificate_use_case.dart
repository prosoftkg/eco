import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/filterList_entity.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/library_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/audit_story_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_certificate_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/repository/repository.dart';

@injectable
class UserCertificateUseCase extends UseCase<List<UserCertificate>,NoParams>{
  final StoryRepository storyRepository;
  UserCertificateUseCase({required this.storyRepository});

  @override
  Future<Either<Failure, List<UserCertificate>>> call(NoParams params) async{
    return await storyRepository.userCertificate();
  }
}