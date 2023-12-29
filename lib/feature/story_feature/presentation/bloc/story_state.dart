part of 'story_bloc.dart';

abstract class StoryState extends Equatable {
  const StoryState();
}

class StoryInitial extends StoryState {
  @override
  List<Object> get props => [];
}

class LoadingAuditStoryState extends StoryState{
  @override
  List<Object> get props=>[];
}

class LoadedAuditStoryState extends StoryState{
  final AuditStoryEntity auditStoryEntity;
  const LoadedAuditStoryState({required this.auditStoryEntity});
  @override
  List<Object> get props=>[auditStoryEntity];
}

class ErrorAuditStoryState extends StoryState{
  final Object error;
  const ErrorAuditStoryState({required this.error});
  @override
  List<Object> get props=>[error];
}

