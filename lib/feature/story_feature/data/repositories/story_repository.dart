import 'package:eco_kg/feature/story_feature/data/data_source/story_server.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/audit_story_entity.dart';
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
}