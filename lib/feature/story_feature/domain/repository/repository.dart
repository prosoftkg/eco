import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/audit_story_entity.dart';
import '../../../../core/error_journal/error_journal.dart';

abstract interface class StoryRepository{
  Future<Either<Failure,AuditStoryEntity>> auditStory();
}
