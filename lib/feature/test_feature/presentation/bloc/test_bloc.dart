import 'package:bloc/bloc.dart';
import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/generalInfoForTest.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userDataForChangeLocal.dart';
import 'package:equatable/equatable.dart';
import '../../../home_feature/domain/entities/test.dart';
import '../../domain/entities/finishTestEntity.dart';
import '../../domain/entities/nextQuestionEntity.dart';
import '../../domain/entities/testIngoForNext.dart';
import '../../domain/use_case/begin_audit_test_use_case.dart';
import '../../domain/use_case/begin_test_use_case.dart';
import '../../domain/use_case/finish_test_use_case.dart';
import '../../domain/use_case/next_text_use_case.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final BeginTestUseCase beginTestUseCase;
  final BeginAuditTestUseCase beginAuditTestUseCase;
  final NextTestUseCase nextTestUseCase;
  final FinishTestUseCase finishTestUseCase;
  final storage = const FlutterSecureStorage();
  TestBloc({required this.nextTestUseCase,required this.finishTestUseCase, required this.beginTestUseCase,required this.beginAuditTestUseCase}) : super(TestInitial()) {
    on<BeginTestEvent>(_beginTest);
    on<BeginAuditTestEvent>(_beginAuditTest);
    on<GlobalAuditTestEvent>(_globalAuditTest);
    on<NextTestEvent>(_nextTest);
    on<FinishTestEvent>(_finishTest);
    on<TestInfoEvent>(_infoTest);
    on<ResultTestEvent>(_resultTest);
    on<CompanyInfoEvent>(_companyInfo);
  }

  _infoTest(TestInfoEvent event,Emitter emit)async{
    emit(LoadingTestState());
    emit(LoadedInfoTestState(infoTest: event.testInfo));
  }
  _companyInfo(CompanyInfoEvent event,Emitter emit)async{
    emit(LoadCompanyInfoState());
  }

  _globalAuditTest(GlobalAuditTestEvent event,Emitter emit)async{
    emit(LoadedTestState(testEntity: event.testEntity,categoryId: event.categoryId,testType: 'auditTest',companyArea: ''));
  }

  _beginTest(BeginTestEvent event,Emitter emit)async{
    emit(LoadingTestState());
    var testInfo=event.testInfoForBegin;
    final either=await beginTestUseCase.call(testInfo);
    either.fold((error) => emit(ErrorTestState(error: error)), (test){
      var userDataForChange=UserDataForChange(companyName: testInfo.companyName, companyDirector: testInfo.companyDirector, region: testInfo.region, phone: testInfo.phone);
      UserData.userDataChange(userDataForChange);
      emit(LoadedTestState(testEntity: test,categoryId: event.testInfoForBegin.categoryId,testType: 'userTest',companyArea: event.testInfoForBegin.areaCompany));
    });
  }

  _beginAuditTest(BeginAuditTestEvent event,Emitter emit)async{
    emit(LoadingTestState());
    final either=await beginAuditTestUseCase.call(event.testId);
    either.fold((error) => emit(ErrorTestState(error: error)), (test){
      emit(LoadedTestState(testEntity: test,categoryId: event.categoryId,testType:'auditTest',companyArea: ''));
    });
  }

  _nextTest(NextTestEvent event,Emitter emit)async{
    emit(LoadingTestState());
    final either=await nextTestUseCase.call(event.testInfoForNext);
    either.fold((error) => emit(ErrorTestState(error: error)), (test){
      emit(LoadedNextTestState(nextTestEntity: test));
    });
  }

  _finishTest(FinishTestEvent event,Emitter emit)async{
    emit(LoadingTestState());
    final either=await finishTestUseCase.call(event.testInfoForNext);
    either.fold((error) => emit(ErrorTestState(error: error)), (test){
      emit(LoadedFinishTestState(finishTestEntity: test,testId: event.testInfoForNext.test_id,testType: event.testInfoForNext.testType));
    });
  }

  _resultTest(ResultTestEvent event,Emitter emit)async{
    emit(LoadingTestState());
    final String? email = await storage.read(key: 'email');
    emit(LoadedResultTestState(finishTestEntity: event.finishTestEntity,email: email!,testId: event.testId, testType: event.tetsType,companyArea: event.companyArea,catId: event.categoryId));
  }
}
