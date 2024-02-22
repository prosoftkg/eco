import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/audit_story_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_certificate_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_story_entity.dart';
import '../../../../core/error_journal/error_journal.dart';

abstract interface class StoryRepository{
  Future<Either<Failure,AuditStoryEntity>> auditStory();
  Future<Either<Failure,UserHistoryEntity>> userStory();
  Future<Either<Failure,String>> downloadUserStory(String testId);
  Future<Either<Failure,List<UserCertificate>>> userCertificate();
}
