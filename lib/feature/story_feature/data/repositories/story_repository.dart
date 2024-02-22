import 'package:eco_kg/feature/story_feature/data/data_source/story_server.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/audit_story_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_certificate_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_story_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_journal/error_journal.dart';
import '../../domain/repository/repository.dart';

@Injectable(as: StoryRepository)

class StoryRepositoryImpl implements StoryRepository{
  final StoryDataSource storyDataSource;
  StoryRepositoryImpl({required this.storyDataSource});

  Future<Either<Failure, AuditStoryEntity>> auditStory() {
    return _auditStory();
  }

  Future<Either<Failure,AuditStoryEntity>> _auditStory() async{
    try{
      final auditStory=await storyDataSource.auditStory();
      return Right(auditStory);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

  Future<Either<Failure, UserHistoryEntity>> userStory() {
    return _userStory();
  }

  Future<Either<Failure,UserHistoryEntity>> _userStory() async{
    try{
      final userStory=await storyDataSource.userStory();
      return Right(userStory);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

  Future<Either<Failure, String>> downloadUserStory(String testId) {
    return _downloadUserStory(testId);
  }

  Future<Either<Failure,String>> _downloadUserStory(String testId) async{
    try{
      final download=await storyDataSource.downloadUserStory(testId);
      return Right(download);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }

  Future<Either<Failure, List<UserCertificate>>> userCertificate() {
    return _userCertificate();
  }

  Future<Either<Failure,List<UserCertificate>>> _userCertificate() async{
    try{
      final userCertificate=await storyDataSource.userCertificate();
      return Right(userCertificate);
    }on Failure catch(e){
      return Left(ServerError(error: e));
    }
  }
}