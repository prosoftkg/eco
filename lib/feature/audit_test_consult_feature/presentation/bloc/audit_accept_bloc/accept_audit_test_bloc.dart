import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/use_case/accept_audit_test_use_case.dart';
import '../../../domain/use_case/denyAuditTest.dart';
part 'accept_audit_test_event.dart';
part 'accept_audit_test_state.dart';

class AcceptAuditTestBloc extends Bloc<AcceptAuditTestEvent, AcceptAuditTestState> {
  final storage = const FlutterSecureStorage();
  final DenyAuditTestUseCase denyAuditTestUseCase;
  final AcceptAuditTestUseCase acceptAuditTestUseCase;
  AcceptAuditTestBloc({required this.denyAuditTestUseCase,required this.acceptAuditTestUseCase}) : super(AcceptAuditTestInitial()) {
    on<OnTapAcceptEvent>(_acceptAuditTest);
    on<CheckAcceptEvent>(_checkAccept);
    on<OnTapDenyEvent>(_denyAuditTest);
  }

  _acceptAuditTest(OnTapAcceptEvent event,Emitter emit)async{
    emit(LoadingAcceptAuditTestState());
    final either=await acceptAuditTestUseCase.call(event.auditTestId);
    either.fold((error) => emit(ErrorAcceptAuditTestState(error: error)), (auditConsult){
      emit(const AcceptedAuditTestState());
    });
    /*final String? accepted = await storage.read(key: 'acceptedAuditTestList');
    Set<String> acceptedList={};
    if(accepted!=null){
      acceptedList=accepted.split(',').toSet();
    }
    acceptedList.remove('');
    acceptedList.add(event.auditTestId);
    await storage.write(
        key: 'acceptedAuditTestList', value: acceptedList.toString().replaceAll('{','').replaceAll('}', '').replaceAll(' ', ''));*/

  }

  _denyAuditTest(OnTapDenyEvent event,Emitter emit)async{
    emit(LoadingAcceptAuditTestState());
    final either=await denyAuditTestUseCase.call(event.auditTestId);
    either.fold((error) => emit(ErrorAcceptAuditTestState(error: error)), (auditTestList){
      emit(const LoadedDenyAuditTestState());
    });
  }

  _acceptTempAuditTest(OnTapAcceptEvent event,Emitter emit)async{
    emit(LoadingAcceptAuditTestState());
    final either=await acceptAuditTestUseCase.call(event.auditTestId);
    either.fold((error) => emit(ErrorAcceptAuditTestState(error: error)), (auditTestList){
      emit(const AcceptedAuditTestState());
    });
  }

  _checkAccept(CheckAcceptEvent event,Emitter emit)async{
    emit(LoadingAcceptAuditTestState());
    final String? accepted = await storage.read(key: 'acceptedAuditTestList');
    Set<String> acceptedList={};
    if(accepted!=null){
      acceptedList=accepted.split(',').toSet();
    }
    print(acceptedList.toString());
    acceptedList.remove('');
    if(acceptedList.contains(event.auditTestId)){
      emit(const AcceptedAuditTestState());
    }else{
      emit(const NewAuditTestState());
    }
  }
}
