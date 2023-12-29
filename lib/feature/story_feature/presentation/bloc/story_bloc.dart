import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/audit_story_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/use_case/use_case.dart';
import '../../domain/use_case/audit_story_use_case.dart';
part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final AuditStoryUseCase auditStoryUseCase;
  StoryBloc({required this.auditStoryUseCase}) : super(StoryInitial()) {
    on<AuditStoryEvent>(_auditStory);
  }
  _auditStory(AuditStoryEvent event,Emitter emit)async{
    emit(LoadingAuditStoryState());
    final either=await auditStoryUseCase.call(NoParams());
    either.fold((error) => emit(ErrorAuditStoryState(error: error)), (auditStory){
      emit(LoadedAuditStoryState(auditStoryEntity: auditStory));
    });
  }
}

