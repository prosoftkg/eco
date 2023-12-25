part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();
}


class TestInfoEvent extends TestEvent{
  final Test testInfo;
  const TestInfoEvent({required this.testInfo});
  @override
  List<Object> get props=>[testInfo];
}

class BeginTestEvent extends TestEvent{
  final TestInfoForBegin testInfoForBegin;
  const BeginTestEvent({required this.testInfoForBegin});
  @override
  List<Object> get props=>[testInfoForBegin];
}

class BeginAuditTestEvent extends TestEvent{
  final String testId;
  final String categoryId;
  const BeginAuditTestEvent({required this.testId,required this.categoryId});
  @override
  List<Object> get props=>[testId];
}

class GlobalAuditTestEvent extends TestEvent{
  final String categoryId;
  final BeginTestEntity testEntity;
  const GlobalAuditTestEvent({required this.testEntity,required this.categoryId});
  @override
  List<Object> get props=>[testEntity,categoryId];
}


class NextTestEvent extends TestEvent{
  final TestInfoForNext testInfoForNext;
  const NextTestEvent({required this.testInfoForNext});
  @override
  List<Object> get props=>[testInfoForNext];
}

class FinishTestEvent extends TestEvent{
  final TestInfoForNext testInfoForNext;
  const FinishTestEvent({required this.testInfoForNext});
  @override
  List<Object> get props=>[testInfoForNext];
}

class ResultTestEvent extends TestEvent{
  final FinishTestEntity finishTestEntity;
  final String testId;
  final String tetsType;
  const ResultTestEvent({required this.finishTestEntity,required this.testId,required this.tetsType});
  @override
  List<Object> get props=>[finishTestEntity];
}
