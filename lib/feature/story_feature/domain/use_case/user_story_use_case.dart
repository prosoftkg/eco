import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_story_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/repository/repository.dart';

@injectable
class UserStoryUseCase extends UseCase<UserHistoryEntity,NoParams>{
  final StoryRepository storyRepository;
  UserStoryUseCase({required this.storyRepository});

  @override
  Future<Either<Failure, UserHistoryEntity>> call(NoParams params) async{
    return await storyRepository.userStory();
  }
}