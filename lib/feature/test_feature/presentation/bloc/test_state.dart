part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();
}

class TestInitial extends TestState {
  @override
  List<Object> get props => [];
}

class LoadingTestState extends TestState{
  @override
  List<Object> get props=>[];
}

class LoadedInfoTestState extends TestState{
  final Test infoTest;
  const LoadedInfoTestState({required this.infoTest});
  @override
  List<Object> get props=>[infoTest];
}

class LoadCompanyInfoState extends TestState{
  const LoadCompanyInfoState();
  @override
  List<Object> get props=>[];
}

class LoadedTestState extends TestState{
  final String companyArea;
  final String categoryId;
  final BeginTestEntity testEntity;
  final String testType;
  const LoadedTestState({required this.testEntity,required this.categoryId,required this.testType,required this.companyArea});
  @override
  List<Object> get props=>[testEntity,categoryId,companyArea,testType];
}

class LoadedNextTestState extends TestState{
  final NextQuestionEntity nextTestEntity;
  const LoadedNextTestState({required this.nextTestEntity});
  @override
  List<Object> get props=>[nextTestEntity];
}

class LoadedFinishTestState extends TestState{
  final FinishTestEntity finishTestEntity;
  final String testId;
  final String testType;
  const LoadedFinishTestState({required this.finishTestEntity,required this.testId,required this.testType});
  @override
  List<Object> get props=>[finishTestEntity,testId];
}

class LoadedResultTestState extends TestState{
  final FinishTestEntity finishTestEntity;
  final String email;
  final String testType;
  final String testId;
  final String catId;
  final String companyArea;
  const LoadedResultTestState({required this.finishTestEntity,required this.email,required this.testId,required this.testType,required this.companyArea,required this.catId});
  @override
  List<Object> get props=>[finishTestEntity,email,testType,testId,catId,companyArea];
}

class ErrorTestState extends TestState{
  final Object error;
  const ErrorTestState({required this.error});
  @override
  List<Object> get props=>[error];
}