part of 'story_bloc.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();
}


class AuditStoryEvent extends StoryEvent{
  const AuditStoryEvent();
  @override
  List<Object> get props=>[];
}