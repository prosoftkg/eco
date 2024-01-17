import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/audit_story_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_story_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/use_case/user_story_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/use_case/use_case.dart';
import '../../domain/use_case/audit_story_use_case.dart';
part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final AuditStoryUseCase auditStoryUseCase;
  final UserStoryUseCase userStoryUseCase;
  StoryBloc({required this.auditStoryUseCase,required this.userStoryUseCase}) : super(StoryInitial()) {
    on<AuditStoryEvent>(_auditStory);
    on<UserStoryEvent>(_userStory);
  }
  _auditStory(AuditStoryEvent event,Emitter emit)async{
    emit(LoadingStoryState());
    final either=await auditStoryUseCase.call(NoParams());
    either.fold((error) => emit(ErrorStoryState(error: error)), (auditStory){
      emit(LoadedAuditStoryState(auditStoryEntity: auditStory));
    });
  }
  _userStory(UserStoryEvent event,Emitter emit)async{
    emit(LoadingStoryState());
    final either=await userStoryUseCase.call(NoParams());
    either.fold((error) => emit(ErrorStoryState(error: error)), (userStory){
      emit(LoadedUserStoryState(userHistoryEntity: userStory));
    });
  }
}

