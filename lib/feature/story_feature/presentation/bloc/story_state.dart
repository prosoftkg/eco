part of 'story_bloc.dart';

abstract class StoryState extends Equatable {
  const StoryState();
}

class StoryInitial extends StoryState {
  @override
  List<Object> get props => [];
}

class LoadingStoryState extends StoryState{
  @override
  List<Object> get props=>[];
}

class LoadedAuditStoryState extends StoryState{
  final AuditStoryEntity auditStoryEntity;
  const LoadedAuditStoryState({required this.auditStoryEntity});
  @override
  List<Object> get props=>[auditStoryEntity];
}

class LoadedUserStoryState extends StoryState{
  final UserHistoryEntity userHistoryEntity;
  const LoadedUserStoryState({required this.userHistoryEntity});
  @override
  List<Object> get props=>[userHistoryEntity];
}

class DownloadedUserStoryState extends StoryState{
  final String urlForDownload;
  const DownloadedUserStoryState({required this.urlForDownload});
  @override
  List<Object> get props=>[urlForDownload];
}

class ErrorStoryState extends StoryState{
  final Object error;
  const ErrorStoryState({required this.error});
  @override
  List<Object> get props=>[error];
}

