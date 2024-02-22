import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_story_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/repository/repository.dart';

@injectable
class DownloadUserStoryUseCase extends UseCase<String,String>{
  final StoryRepository storyRepository;
  DownloadUserStoryUseCase({required this.storyRepository});

  @override
  Future<Either<Failure, String>> call(String testId) async{
    return await storyRepository.downloadUserStory(testId);
  }
}