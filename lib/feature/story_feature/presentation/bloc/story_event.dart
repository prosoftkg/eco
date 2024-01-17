part of 'story_bloc.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();
}


class AuditStoryEvent extends StoryEvent{
  const AuditStoryEvent();
  @override
  List<Object> get props=>[];
}

class UserStoryEvent extends StoryEvent{
  const UserStoryEvent();
  @override
  List<Object> get props=>[];
}